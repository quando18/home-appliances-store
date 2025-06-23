// Test script để kiểm tra chức năng xóa user
const axios = require('axios');

const API_BASE_URL = 'http://localhost:3014/api/v1';

async function testUserDelete() {
    try {
        console.log('=== Testing User Delete Functionality ===\n');
        
        // 1. Tạo user test
        console.log('1. Creating test user...');
        const createUserResponse = await axios.post(`${API_BASE_URL}/admin/users`, {
            name: 'Test User Delete',
            email: 'testdelete@example.com',
            password: 'password123',
            user_type: 'USER'
        });
        
        const userId = createUserResponse.data.data.user.id;
        console.log(`✓ Created user with ID: ${userId}`);
        
        // 2. Tạo đơn hàng pending để test ràng buộc
        console.log('\n2. Creating pending order...');
        const orderResponse = await axios.post(`${API_BASE_URL}/order`, {
            user_id: userId,
            payment_method_id: 1,
            products: [
                { id: 1, quantity: 1 }
            ],
            total_amount: 100000,
            status: 'pending',
            payment_status: 'pending'
        });
        
        console.log(`✓ Created pending order`);
        
        // 3. Thử xóa user khi còn đơn hàng pending (should fail)
        console.log('\n3. Trying to delete user with pending orders...');
        try {
            await axios.delete(`${API_BASE_URL}/admin/users/${userId}`);
            console.log('✗ ERROR: Should not be able to delete user with pending orders');
        } catch (error) {
            if (error.response && error.response.status === 400) {
                console.log(`✓ Correctly blocked deletion: ${error.response.data.message}`);
            } else {
                console.log('✗ Unexpected error:', error.message);
            }
        }
        
        // 4. Cập nhật đơn hàng thành completed
        console.log('\n4. Completing the order...');
        const orderId = orderResponse.data.id;
        await axios.put(`${API_BASE_URL}/admin/order/${orderId}`, {
            status: 'completed',
            payment_status: 'completed'
        });
        console.log('✓ Order completed');
        
        // 5. Tạo vote/review
        console.log('\n5. Creating vote/review...');
        await axios.post(`${API_BASE_URL}/user/vote`, {
            product_id: 1,
            user_id: userId,
            rating: 5,
            comment: 'Test review'
        });
        console.log('✓ Vote/review created');
        
        // 6. Thử xóa user lần nữa (should succeed)
        console.log('\n6. Deleting user with completed orders...');
        const deleteResponse = await axios.delete(`${API_BASE_URL}/admin/users/${userId}`);
        
        if (deleteResponse.data.status === 'success') {
            console.log('✓ User deleted successfully');
            console.log('Deleted data:', deleteResponse.data.data.deletedData);
        } else {
            console.log('✗ Failed to delete user:', deleteResponse.data.message);
        }
        
        console.log('\n=== Test completed ===');
        
    } catch (error) {
        console.error('Test failed:', error.response?.data || error.message);
    }
}

// Chạy test
testUserDelete();
