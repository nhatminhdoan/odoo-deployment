# 🚀 Hướng dẫn Triển khai Odoo Nhanh

## Tổng quan
Dự án này đã được cấu hình sẵn để triển khai Odoo trên các nền tảng cloud khác nhau. **Không thể triển khai trực tiếp trên Vercel hoặc Firebase** do Odoo yêu cầu môi trường server đầy đủ.

## 🎯 Các nền tảng được hỗ trợ

### 1. Render (Khuyến nghị) ⭐
- ✅ Miễn phí 750 giờ/tháng
- ✅ Hỗ trợ PostgreSQL
- ✅ Tự động deploy từ GitHub
- ✅ Dễ cấu hình

### 2. Fly.io
- ✅ Hiệu suất cao
- ✅ Global deployment
- ✅ Có free tier

### 3. Railway
- ✅ Deploy đơn giản
- ✅ Tự động cấu hình database

### 4. Heroku
- ✅ Ổn định, đáng tin cậy
- ✅ Cộng đồng lớn

## 🚀 Triển khai nhanh trên Render

### Bước 1: Chuẩn bị
```bash
# Clone repository (nếu chưa có)
git clone <your-repo-url>
cd odoo

# Chạy script setup
./scripts/setup.sh
```

### Bước 2: Push lên GitHub
```bash
# Commit và push code
git add .
git commit -m "Initial Odoo deployment setup"
git push origin main
```

### Bước 3: Deploy trên Render
1. Truy cập [render.com](https://render.com)
2. Đăng ký/đăng nhập
3. Kết nối GitHub repository
4. Tạo PostgreSQL Database:
   - Name: `odoo-db`
   - Database: `odoo`
   - User: `odoo`
   - Region: Singapore
5. Tạo Web Service:
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `python3 odoo-bin -c config/odoo.conf`
   - Port: `8069`
6. Thêm Environment Variables:
   ```
   HOST=<database_host_from_render>
   PORT=<database_port_from_render>
   USER=odoo
   PASSWORD=<database_password_from_render>
   DATABASE=odoo
   ```

### Bước 4: Truy cập Odoo
- URL: `https://your-app-name.onrender.com`
- Username: `admin`
- Password: `admin` (thay đổi ngay!)

## 🐳 Triển khai local với Docker

```bash
# Chạy setup
./scripts/setup.sh

# Copy file cấu hình
cp env.example .env

# Chỉnh sửa .env với thông tin database local
# Sau đó chạy:
docker-compose up -d

# Truy cập: http://localhost:8069
```

## 🔧 Các script có sẵn

- `./scripts/setup.sh` - Setup ban đầu
- `./scripts/test-config.sh` - Test cấu hình
- `./scripts/deploy-render.sh` - Deploy lên Render
- `./scripts/deploy-fly.sh` - Deploy lên Fly.io

## 📁 Cấu trúc file quan trọng

```
odoo/
├── Dockerfile              # Docker image cho production
├── docker-compose.yml      # Local development
├── render.yaml            # Cấu hình Render
├── fly.toml               # Cấu hình Fly.io
├── requirements.txt       # Python dependencies
├── requirements-prod.txt  # Production dependencies
├── env.example           # Environment variables mẫu
├── config/
│   └── odoo.conf         # Cấu hình Odoo
└── scripts/              # Deployment scripts
```

## ⚠️ Lưu ý quan trọng

1. **Render miễn phí có giới hạn**: 750 giờ/tháng
2. **Database sẽ sleep** sau 90 phút không hoạt động
3. **Cần upgrade plan** để có hiệu suất tốt hơn
4. **Thay đổi password admin** ngay sau khi deploy
5. **Backup database** thường xuyên

## 🆘 Troubleshooting

### Lỗi build
- Kiểm tra `requirements.txt`
- Kiểm tra Dockerfile
- Xem logs trong Render dashboard

### Lỗi database
- Kiểm tra environment variables
- Kiểm tra kết nối database
- Restart service

### Lỗi timeout
- Tăng thời gian build trong Render settings
- Kiểm tra memory usage

## 📞 Hỗ trợ

- [Odoo Documentation](https://www.odoo.com/documentation)
- [Render Documentation](https://render.com/docs)
- [Fly.io Documentation](https://fly.io/docs)

---

**Chúc bạn triển khai thành công! 🎉**
