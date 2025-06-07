// Test script để kiểm tra API hủy đơn hàng
const axios = require('axios');

const API_BASE_URL = 'http://localhost:3014/api/v1';

// Test với order ID 8 và token user
const TEST_ORDER_ID = 8;
const USER_TOKEN = 'your_user_token_here'; // Thay bằng token thực tế

async function testCancelOrder() {
    try {
        console.log('=== Testing Cancel Order API ===');
        console.log(`Order ID: ${TEST_ORDER_ID}`);
        console.log(`API URL: ${API_BASE_URL}/user/order/cancel/${TEST_ORDER_ID}`);
        
        // 1. Lấy thông tin đơn hàng trước khi hủy
        console.log('\n1. Getting order info before cancel...');
        try {
            const getOrderResponse = await axios.get(`${API_BASE_URL}/user/order/${TEST_ORDER_ID}`, {
                headers: {
                    'Authorization': `Bearer ${USER_TOKEN}`,
                    'Content-Type': 'application/json'
                }
            });
            
            const order = getOrderResponse.data.data;
            console.log('Order before cancel:');
            console.log(`- Status: ${order.status}`);
            console.log(`- Payment Status: ${order.payment_status}`);
            console.log(`- User ID: ${order.user_id}`);
            console.log(`- Products: ${order.products?.length || 0} items`);
        } catch (error) {
            console.log('Could not get order info:', error.response?.data?.message || error.message);
        }
        
        // 2. Thực hiện hủy đơn hàng
        console.log('\n2. Canceling order...');
        
        const cancelResponse = await axios.post(`${API_BASE_URL}/user/order/cancel/${TEST_ORDER_ID}`, {}, {
            headers: {
                'Authorization': `Bearer ${USER_TOKEN}`,
                'Content-Type': 'application/json'
            }
        });
        
        console.log('Cancel response:', cancelResponse.data);
        
        // 3. Kiểm tra trạng thái sau khi hủy
        console.log('\n3. Checking order status after cancel...');
        try {
            const getOrderAfterResponse = await axios.get(`${API_BASE_URL}/user/order/${TEST_ORDER_ID}`, {
                headers: {
                    'Authorization': `Bearer ${USER_TOKEN}`,
                    'Content-Type': 'application/json'
                }
            });
            
            const orderAfter = getOrderAfterResponse.data.data;
            console.log('Order after cancel:');
            console.log(`- Status: ${orderAfter.status}`);
            console.log(`- Payment Status: ${orderAfter.payment_status}`);
        } catch (error) {
            console.log('Could not get order info after cancel:', error.response?.data?.message || error.message);
        }
        
        console.log('\n=== Test completed successfully ===');
        
    } catch (error) {
        console.error('\n=== Test failed ===');
        console.error('Error details:');
        console.error('Status:', error.response?.status);
        console.error('Message:', error.response?.data?.message || error.message);
        console.error('Full response:', error.response?.data);
    }
}

// Hướng dẫn sử dụng
console.log(`
=== Cancel Order API Test ===

Trước khi chạy test, hãy:
1. Đảm bảo server đang chạy tại ${API_BASE_URL}
2. Thay đổi TEST_ORDER_ID = ${TEST_ORDER_ID} thành ID đơn hàng thực tế
3. Thay đổi USER_TOKEN thành token user hợp lệ
4. Đảm bảo đơn hàng thuộc về user và có payment_status != 'completed'

Để chạy test: node test_cancel_order.js
`);

// Chạy test nếu file được gọi trực tiếp
if (require.main === module) {
    if (USER_TOKEN === 'your_user_token_here') {
        console.log('❌ Please update USER_TOKEN before running the test');
    } else {
        testCancelOrder();
    }
}

module.exports = { testCancelOrder };
