// Script để kiểm tra thông tin sản phẩm và tồn kho trong database
const db = require('./api/src/config/dbMysql');

async function checkProductStock() {
    try {
        console.log('=== KIỂM TRA THÔNG TIN SẢN PHẨM VÀ TỒN KHO ===\n');
        
        // 1. Lấy thông tin sản phẩm từ slug
        const slug = 'may-xay-sinh-to-cam-tay-400ml-elmich-ble9215-3';
        const productId = slug.split('-').pop(); // Lấy ID từ cuối slug
        
        console.log(`1. Kiểm tra sản phẩm với slug: ${slug}`);
        console.log(`   Product ID từ slug: ${productId}\n`);
        
        // 2. Truy vấn thông tin sản phẩm
        const [productRows] = await db.query(
            'SELECT id, name, price, number, status, created_at FROM ec_products WHERE id = ?',
            [productId]
        );
        
        if (productRows.length === 0) {
            console.log('❌ Không tìm thấy sản phẩm với ID này');
            return;
        }
        
        const product = productRows[0];
        console.log('2. Thông tin sản phẩm:');
        console.log(`   - ID: ${product.id}`);
        console.log(`   - Tên: ${product.name}`);
        console.log(`   - Giá: ${product.price.toLocaleString()} VND`);
        console.log(`   - Số lượng tồn kho: ${product.number}`);
        console.log(`   - Trạng thái: ${product.status}`);
        console.log(`   - Ngày tạo: ${product.created_at}\n`);
        
        // 3. Kiểm tra các giao dịch liên quan đến sản phẩm này
        console.log('3. Kiểm tra lịch sử giao dịch:');
        const [transactionRows] = await db.query(`
            SELECT 
                t.id,
                t.order_id,
                t.qty,
                t.price,
                t.total_price,
                t.status,
                t.created_at,
                o.code as order_code,
                o.status as order_status,
                o.payment_status
            FROM ec_transactions t
            LEFT JOIN ec_orders o ON t.order_id = o.id
            WHERE t.product_id = ?
            ORDER BY t.created_at DESC
            LIMIT 10
        `, [productId]);
        
        if (transactionRows.length === 0) {
            console.log('   - Chưa có giao dịch nào cho sản phẩm này\n');
        } else {
            console.log(`   - Tìm thấy ${transactionRows.length} giao dịch gần nhất:`);
            transactionRows.forEach((transaction, index) => {
                console.log(`   ${index + 1}. Order: ${transaction.order_code || 'N/A'}`);
                console.log(`      - Số lượng: ${transaction.qty}`);
                console.log(`      - Giá: ${transaction.price.toLocaleString()} VND`);
                console.log(`      - Trạng thái đơn: ${transaction.order_status}`);
                console.log(`      - Trạng thái thanh toán: ${transaction.payment_status}`);
                console.log(`      - Ngày: ${transaction.created_at}`);
                console.log('');
            });
        }
        
        // 4. Tính tổng số lượng đã bán
        const [soldRows] = await db.query(`
            SELECT 
                SUM(t.qty) as total_sold,
                COUNT(DISTINCT t.order_id) as total_orders
            FROM ec_transactions t
            LEFT JOIN ec_orders o ON t.order_id = o.id
            WHERE t.product_id = ? 
            AND o.payment_status = 'completed'
        `, [productId]);
        
        const totalSold = soldRows[0].total_sold || 0;
        const totalOrders = soldRows[0].total_orders || 0;
        
        console.log('4. Thống kê bán hàng:');
        console.log(`   - Tổng số lượng đã bán: ${totalSold}`);
        console.log(`   - Tổng số đơn hàng: ${totalOrders}\n`);
        
        // 5. Kiểm tra đơn hàng pending
        const [pendingRows] = await db.query(`
            SELECT 
                SUM(t.qty) as pending_qty,
                COUNT(DISTINCT t.order_id) as pending_orders
            FROM ec_transactions t
            LEFT JOIN ec_orders o ON t.order_id = o.id
            WHERE t.product_id = ? 
            AND (o.payment_status != 'completed' OR o.status != 'completed')
        `, [productId]);
        
        const pendingQty = pendingRows[0].pending_qty || 0;
        const pendingOrders = pendingRows[0].pending_orders || 0;
        
        console.log('5. Đơn hàng chưa hoàn thành:');
        console.log(`   - Số lượng trong đơn chưa hoàn thành: ${pendingQty}`);
        console.log(`   - Số đơn hàng chưa hoàn thành: ${pendingOrders}\n`);
        
        // 6. Tính số lượng khả dụng thực tế
        const availableStock = product.number - pendingQty;
        
        console.log('6. Phân tích tồn kho:');
        console.log(`   - Tồn kho trong DB: ${product.number}`);
        console.log(`   - Đang chờ xử lý: ${pendingQty}`);
        console.log(`   - Khả dụng thực tế: ${availableStock}`);
        
        if (availableStock <= 0) {
            console.log('   ⚠️  CẢNH BÁO: Sản phẩm đã hết hàng hoặc không đủ tồn kho!');
        } else if (availableStock < 5) {
            console.log('   ⚠️  CẢNH BÁO: Tồn kho sắp hết!');
        } else {
            console.log('   ✅ Tồn kho đủ để bán');
        }
        
        console.log('\n=== KẾT THÚC KIỂM TRA ===');
        
    } catch (error) {
        console.error('Lỗi khi kiểm tra:', error);
    } finally {
        process.exit(0);
    }
}

// Chạy script
checkProductStock();
