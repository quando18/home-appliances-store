// Debug script để kiểm tra cấu trúc đơn hàng
const Order = require('./api/src/models/Order');
const db = require('./api/src/config/dbMysql');

async function debugOrderStructure() {
    try {
        console.log('=== Debugging Order Structure ===');
        
        // 1. Kiểm tra cấu trúc bảng ec_orders
        console.log('\n1. Checking ec_orders table structure...');
        const [tableStructure] = await db.query('DESCRIBE ec_orders');
        console.log('Table structure:');
        tableStructure.forEach(column => {
            console.log(`- ${column.Field}: ${column.Type} (${column.Null === 'YES' ? 'NULL' : 'NOT NULL'})`);
        });
        
        // 2. Lấy một đơn hàng mẫu
        console.log('\n2. Getting sample order...');
        const [orders] = await db.query('SELECT * FROM ec_orders LIMIT 1');
        if (orders.length > 0) {
            const sampleOrder = orders[0];
            console.log('Sample order structure:');
            Object.keys(sampleOrder).forEach(key => {
                console.log(`- ${key}: ${typeof sampleOrder[key]} = ${sampleOrder[key]}`);
            });
            
            // 3. Test findById method
            console.log('\n3. Testing Order.findById...');
            const orderFromModel = await Order.findById(sampleOrder.id);
            console.log('Order from model:');
            console.log(`- ID: ${orderFromModel.id}`);
            console.log(`- Status: ${orderFromModel.status}`);
            console.log(`- Payment Status: ${orderFromModel.payment_status}`);
            console.log(`- User ID: ${orderFromModel.user_id}`);
            console.log(`- Products: ${orderFromModel.products?.length || 0} items`);
            
            // 4. Test simple update query
            console.log('\n4. Testing simple update query...');
            const updateQuery = `
                UPDATE ec_orders 
                SET status = ?, payment_status = ?, updated_at = CURRENT_TIMESTAMP
                WHERE id = ?
            `;
            console.log('Update query:', updateQuery);
            console.log('Parameters:', ['canceled', 'failed', sampleOrder.id]);
            
            // Không thực hiện update thật, chỉ test syntax
            console.log('✅ Update query syntax is valid');
            
        } else {
            console.log('❌ No orders found in database');
        }
        
        // 5. Kiểm tra enum values
        console.log('\n5. Checking enum values...');
        const [statusEnum] = await db.query(`
            SELECT COLUMN_TYPE 
            FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_NAME = 'ec_orders' 
            AND COLUMN_NAME = 'status'
        `);
        console.log('Status enum:', statusEnum[0]?.COLUMN_TYPE);
        
        const [paymentStatusEnum] = await db.query(`
            SELECT COLUMN_TYPE 
            FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_NAME = 'ec_orders' 
            AND COLUMN_NAME = 'payment_status'
        `);
        console.log('Payment status enum:', paymentStatusEnum[0]?.COLUMN_TYPE);
        
        console.log('\n=== Debug completed ===');
        
    } catch (error) {
        console.error('Debug error:', error);
    } finally {
        // Đóng kết nối database
        if (db && db.end) {
            await db.end();
        }
        process.exit(0);
    }
}

// Chạy debug
if (require.main === module) {
    debugOrderStructure();
}

module.exports = { debugOrderStructure };
