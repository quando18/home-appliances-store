# 📝 Hệ Thống Blog HomeLife Store

## 🎯 Tổng quan

Hệ thống blog đã được tích hợp hoàn chỉnh vào website HomeLife Store, sử dụng hệ thống quản lý có sẵn trong admin panel với các tính năng:

- ✅ Danh sách bài viết với phân trang
- ✅ Chi tiết bài viết với nội dung đầy đủ
- ✅ Tìm kiếm và lọc theo danh mục
- ✅ Bài viết nổi bật
- ✅ Bài viết liên quan
- ✅ Responsive design
- ✅ SEO friendly URLs
- ✅ Chia sẻ và in bài viết
- ✅ Tích hợp với admin panel có sẵn

## 🚀 Demo

Để xem demo ngay lập tức mà không cần setup database:

1. **Trang danh sách blog demo**: `/blog-test`
2. **Trang chi tiết blog demo**: Click vào bất kỳ bài viết nào trong `/blog-test`

## 🛠️ Sử dụng với hệ thống có sẵn

### 1. Admin Panel

Hệ thống blog sử dụng admin panel có sẵn:

- **Quản lý bài viết**: `http://localhost:3000/admin/news/articles`
- **Quản lý danh mục**: `http://localhost:3000/admin/news/menus`

### 2. Không cần migration

Hệ thống sử dụng database và bảng có sẵn, không cần chạy migration mới.

### 3. API Endpoints

Các API guest đã được tạo để frontend gọi:

```
GET /posts                    - Lấy danh sách bài viết (chỉ published)
GET /posts/show/:id          - Lấy chi tiết bài viết theo ID
GET /posts/show-slug/:slug   - Lấy chi tiết bài viết theo slug
GET /menus                   - Lấy danh sách menu/danh mục
```

### 4. Frontend Routes

```
/blog                        - Trang danh sách blog
/blog/:slug                  - Trang chi tiết blog
/blog-test                   - Demo danh sách blog
/blog-test/:slug            - Demo chi tiết blog
```

## 📁 Cấu trúc Files

### Backend (API)
```
api/
├── src/routes/guest/article.js           # Routes cho guest articles
├── src/routes/guest/menu.js              # Routes cho guest menus
├── src/controllers/guest/articleController.js # Controller articles
├── src/controllers/guest/menuController.js    # Controller menus
└── src/models/Post.js                    # Model đã có sẵn (sử dụng lại)
```

### Frontend
```
client/src/
├── pages/site/blog/
│   ├── BlogList.js          # Trang danh sách blog
│   ├── BlogList.css         # CSS cho danh sách
│   ├── BlogDetail.js        # Trang chi tiết blog
│   ├── BlogDetail.css       # CSS cho chi tiết
│   ├── BlogTest.js          # Demo danh sách
│   └── BlogDetailTest.js    # Demo chi tiết
├── api/blogService.js       # Service gọi API
└── App.js                   # Routes đã được thêm
```

## 🎨 Thiết kế

### Color Scheme
- **Primary**: #1976d2 (Blue)
- **Secondary**: #1565c0 (Dark Blue)
- **Background**: Linear gradient #f5f7fa to #e8f0fe
- **Cards**: White với shadow và border radius 20px

### Features
- **Responsive**: Mobile-first design
- **Loading**: Skeleton loading với react-content-loader
- **Search**: Tìm kiếm theo tên bài viết
- **Filter**: Lọc theo danh mục
- **Pagination**: Phân trang với Bootstrap
- **Meta**: Hiển thị ngày đăng, lượt xem
- **Featured**: Badge cho bài viết nổi bật

## 📊 Dữ liệu

Hệ thống sử dụng dữ liệu từ admin panel có sẵn:
- **Quản lý danh mục**: Tạo và quản lý danh mục blog qua admin panel
- **Quản lý bài viết**: Tạo và quản lý bài viết qua admin panel
- **Trạng thái**: Chỉ hiển thị bài viết có status = 'published' trên frontend

## 🔧 Cấu hình

### API Configuration
File `api/src/routes/index.js` đã được thêm:
```javascript
router.use('/posts', require('./guest/article'));
router.use('/menus', require('./guest/menu'));
```

### Frontend Configuration
File `client/src/App.js` đã được thêm routes:
```javascript
<Route path="blog" element={<BlogList />} />
<Route path="blog/:slug" element={<BlogDetail />} />
```

## 🌐 Navigation

Link "BLOG" đã được thêm vào header navigation (Header.js line 122-124).

## 📱 Responsive

- **Desktop**: Grid 3 cột
- **Tablet**: Grid 2 cột
- **Mobile**: Grid 1 cột
- **Sidebar**: Sticky trên desktop, stack trên mobile

## 🔍 SEO

- **URLs**: Friendly URLs với slug tiếng Việt
- **Meta tags**: Title, description cho mỗi bài viết
- **Structured data**: Ready cho Google indexing

## 🚀 Deployment

1. Khởi động API server: `cd api && npm run dev`
2. Khởi động frontend: `cd client && npm start`
3. Tạo bài viết và danh mục qua admin panel
4. Truy cập `/blog` để xem blog hoặc `/blog-test` để xem demo

## 🎯 Next Steps

1. **Comments**: Thêm hệ thống bình luận
2. **Categories**: Trang danh mục blog riêng
3. **Tags**: Trang tags blog
4. **Search**: Tìm kiếm nâng cao
5. **Analytics**: Theo dõi lượt xem, thống kê
6. **SEO**: Meta tags và Open Graph

## 📞 Support

Nếu có vấn đề gì, hãy kiểm tra:
1. Database connection
2. API server đang chạy
3. Admin panel có dữ liệu bài viết và danh mục
4. Routes đã được thêm đúng
5. Dependencies đã được cài đặt (`react-content-loader`)

---

**Chúc bạn sử dụng hệ thống blog thành công! 🎉**
