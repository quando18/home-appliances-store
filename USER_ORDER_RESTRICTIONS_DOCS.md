# User Order Restrictions Documentation

## Tổng quan
Hệ thống đã được cập nhật để giới hạn quyền của user trong việc quản lý đơn hàng. User chỉ được phép:
- Xem danh sách đơn hàng của mình
- Xem chi tiết đơn hàng
- Hủy đơn hàng khi chưa thanh toán
- **KHÔNG** được cập nhật trạng thái hoàn thành
- **KHÔNG** được cập nhật trạng thái thanh toán thành completed

## Các thay đổi đã thực hiện

### 1. Backend API Changes

#### File: `api/src/controllers/guest/orderController.js`

**Thêm methods mới:**

##### `getById(req, res)`
- Lấy chi tiết đơn hàng với kiểm tra quyền sở hữu
- Chỉ cho phép user xem đơn hàng của chính mình
- Trả về 403 nếu user cố gắng xem đơn hàng của người khác

##### `cancelOrder(req, res)`
- Cho phép user hủy đơn hàng với các điều kiện:
  - Đơn hàng phải thuộc về user hiện tại
  - `payment_status` phải khác `'completed'`
  - `status` phải khác `'completed'`
- Tự động hoàn trả số lượng sản phẩm nếu đơn hàng đã thanh toán
- Cập nhật trạng thái thành `'canceled'` và `payment_status` thành `'failed'`

#### File: `api/src/routes/user/order.js`

**Thêm routes mới:**
```javascript
router.get('/:id', auth, orderController.getById);
router.post('/cancel/:id', auth, orderController.cancelOrder);
```

### 2. Frontend Changes

#### File: `client/src/pages/user/components/order/UserOrderModal.js`

**Modal mới cho user với các tính năng:**
- Hiển thị chi tiết đơn hàng
- Hiển thị trạng thái với badge màu sắc
- Nút "Hủy đơn hàng" chỉ hiện khi:
  - `payment_status !== 'completed'`
  - `status !== 'completed'`
  - `status !== 'canceled'`
- Modal xác nhận trước khi hủy đơn hàng
- Tự động refresh danh sách sau khi hủy thành công

#### File: `client/src/pages/user/OrderManager.js`

**Cập nhật giao diện:**
- Xóa nút "Xóa đơn hàng" 
- Thay đổi nút "Cập nhật" thành "Quản lý đơn hàng"
- Sử dụng `UserOrderModal` thay vì `NewOrderModal`
- Loại bỏ các function không cần thiết

#### File: `client/src/pages/admin/components/order/NewOrderModal.js`

**Thêm giới hạn quyền cho user:**
- Disable dropdown trạng thái thanh toán cho user
- Disable dropdown trạng thái đơn hàng cho user
- Filter options: user chỉ thấy `pending`, `canceled`, `failed`
- Validation trong `handleSaveOrder`:
  - Ngăn user set `payment_status = 'completed'`
  - Ngăn user set `status = 'completed'`
  - Ngăn user hủy đơn hàng đã thanh toán

#### File: `client/src/api/apiOrderService.js`

**Thêm methods mới:**
```javascript
getById: (id) => apiHelper.get(`user/order/${id}`),
cancelOrder: (id) => apiHelper.post(`user/order/cancel/${id}`)
```

## API Endpoints

### GET /api/v1/user/order/:id
Lấy chi tiết đơn hàng của user hiện tại.

**Headers:**
```
Authorization: Bearer <token>
```

**Response Success (200):**
```json
{
    "status": "success",
    "data": {
        "id": 6,
        "code": "ORD-001",
        "user_id": 1,
        "payment_status": "pending",
        "status": "pending",
        "amount": 1000000,
        "products": [...]
    }
}
```

**Response Error (403):**
```json
{
    "status": "error",
    "message": "Access denied"
}
```

### POST /api/v1/user/order/cancel/:id
Hủy đơn hàng của user hiện tại.

**Headers:**
```
Authorization: Bearer <token>
```

**Response Success (200):**
```json
{
    "status": "success",
    "data": {
        "id": 6,
        "status": "canceled",
        "payment_status": "failed"
    },
    "message": "Order canceled successfully"
}
```

**Response Error (400):**
```json
{
    "status": "error",
    "message": "Cannot cancel order that has been paid"
}
```

## Business Rules

### 1. User Permissions
- ✅ **Được phép**: Xem đơn hàng của mình
- ✅ **Được phép**: Hủy đơn hàng khi `payment_status != 'completed'`
- ❌ **Không được phép**: Xem đơn hàng của user khác
- ❌ **Không được phép**: Cập nhật `payment_status = 'completed'`
- ❌ **Không được phép**: Cập nhật `status = 'completed'`
- ❌ **Không được phép**: Hủy đơn hàng đã thanh toán
- ❌ **Không được phép**: Hủy đơn hàng đã hoàn thành

### 2. Admin Permissions
- ✅ **Được phép**: Tất cả quyền của user
- ✅ **Được phép**: Cập nhật mọi trạng thái đơn hàng
- ✅ **Được phép**: Cập nhật trạng thái thanh toán
- ✅ **Được phép**: Xem/sửa đơn hàng của tất cả user

### 3. Stock Management
- Khi `payment_status` chuyển từ khác → `'completed'`: Trừ số lượng sản phẩm
- Khi `payment_status` chuyển từ `'completed'` → khác: Hoàn trả số lượng sản phẩm
- Khi user hủy đơn hàng đã thanh toán: Tự động hoàn trả số lượng

## UI/UX Changes

### User Order Page (`/user/orders`)
- **Trước**: User có thể xóa đơn hàng, cập nhật mọi trạng thái
- **Sau**: User chỉ có thể xem chi tiết và hủy đơn hàng (nếu được phép)

### User Order Modal
- Hiển thị thông tin đầy đủ với badge trạng thái
- Nút "Hủy đơn hàng" chỉ hiện khi đủ điều kiện
- Cảnh báo rõ ràng khi không thể hủy
- Modal xác nhận trước khi hủy

### Admin Order Modal
- Giữ nguyên tất cả tính năng cho admin
- Thêm validation để ngăn user bypass quyền hạn

## Testing

### Test Cases cho User

1. **Test hủy đơn hàng hợp lệ:**
   - Tạo đơn hàng với `payment_status = 'pending'`
   - User hủy đơn hàng → Thành công

2. **Test hủy đơn hàng đã thanh toán:**
   - Tạo đơn hàng với `payment_status = 'completed'`
   - User cố hủy đơn hàng → Lỗi 400

3. **Test xem đơn hàng của người khác:**
   - User A cố xem đơn hàng của User B → Lỗi 403

4. **Test cập nhật trạng thái không được phép:**
   - User cố set `payment_status = 'completed'` → Bị chặn ở frontend và backend

### Test Cases cho Admin

1. **Test quyền admin:**
   - Admin có thể cập nhật mọi trạng thái → Thành công
   - Admin có thể xem đơn hàng của mọi user → Thành công

## Security Considerations

1. **Authorization**: Mọi endpoint đều kiểm tra quyền sở hữu đơn hàng
2. **Validation**: Double validation ở cả frontend và backend
3. **Role-based Access**: Phân quyền rõ ràng giữa user và admin
4. **Data Integrity**: Đảm bảo stock được cập nhật chính xác khi hủy đơn hàng
