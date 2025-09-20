# Hướng dẫn Triển khai Odoo trên Render

## Tổng quan
Odoo không thể triển khai trực tiếp trên Vercel hoặc Firebase do yêu cầu môi trường server đầy đủ và cơ sở dữ liệu PostgreSQL. Render là lựa chọn tốt nhất cho việc triển khai Odoo.

## Các bước triển khai

### 1. Chuẩn bị Repository
- Push code lên GitHub/GitLab
- Đảm bảo có các file: `Dockerfile`, `render.yaml`, `requirements.txt`

### 2. Tạo tài khoản Render
1. Truy cập [render.com](https://render.com)
2. Đăng ký tài khoản miễn phí
3. Kết nối với GitHub/GitLab

### 3. Tạo Database PostgreSQL
1. Vào Dashboard → New → PostgreSQL
2. Chọn:
   - Name: `odoo-db`
   - Database: `odoo`
   - User: `odoo`
   - Region: Singapore (gần Việt Nam nhất)
   - Plan: Starter (miễn phí)

### 4. Tạo Web Service
1. Vào Dashboard → New → Web Service
2. Kết nối với repository GitHub
3. Cấu hình:
   - Name: `odoo-app`
   - Environment: `Python 3`
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `python3 odoo-bin -c config/odoo.conf`
   - Port: `8069`

### 5. Cấu hình Environment Variables
Thêm các biến môi trường:
```
HOST=<database_host_from_render>
PORT=<database_port_from_render>
USER=odoo
PASSWORD=<database_password_from_render>
DATABASE=odoo
```

### 6. Deploy
1. Click "Create Web Service"
2. Render sẽ tự động build và deploy
3. Chờ 5-10 phút để hoàn thành

## Truy cập Odoo
- URL: `https://your-app-name.onrender.com`
- Username: `admin`
- Password: `admin` (thay đổi ngay sau khi đăng nhập)

## Lưu ý quan trọng
- Render miễn phí có giới hạn: 750 giờ/tháng
- Database sẽ sleep sau 90 phút không hoạt động
- Cần upgrade plan để có hiệu suất tốt hơn

## Troubleshooting
- Nếu lỗi build: Kiểm tra `requirements.txt`
- Nếu lỗi database: Kiểm tra environment variables
- Nếu timeout: Tăng thời gian build trong settings
