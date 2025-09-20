# 🚀 Odoo Deployment Project

Dự án này đã được cấu hình sẵn để triển khai Odoo trên các nền tảng cloud khác nhau.

## ⚠️ Quan trọng: Không thể triển khai trên Vercel/Firebase

**Odoo không thể triển khai trực tiếp trên Vercel hoặc Firebase** vì:
- Odoo yêu cầu môi trường server đầy đủ với Python backend
- Cần cơ sở dữ liệu PostgreSQL phức tạp
- Không phù hợp với mô hình serverless

## 🎯 Các nền tảng được hỗ trợ

### 1. **Render** (Khuyến nghị) ⭐
- ✅ Miễn phí 750 giờ/tháng
- ✅ Hỗ trợ PostgreSQL
- ✅ Tự động deploy từ GitHub
- ✅ Dễ cấu hình

### 2. **Fly.io**
- ✅ Hiệu suất cao
- ✅ Global deployment
- ✅ Có free tier

### 3. **Railway**
- ✅ Deploy đơn giản
- ✅ Tự động cấu hình database

### 4. **Heroku**
- ✅ Ổn định, đáng tin cậy
- ✅ Cộng đồng lớn

## 🚀 Triển khai nhanh

### Bước 1: Chuẩn bị
```bash
# Clone repository
git clone <your-repo-url>
cd odoo

# Chạy script setup
./scripts/setup.sh
```

### Bước 2: Deploy lên Render (Khuyến nghị)
```bash
# Push code lên GitHub
git add .
git commit -m "Initial Odoo deployment setup"
git push origin main

# Chạy script deploy
./scripts/deploy-render.sh
```

Sau đó làm theo hướng dẫn trong script để:
1. Tạo tài khoản Render
2. Kết nối GitHub repository
3. Tạo PostgreSQL Database
4. Tạo Web Service
5. Cấu hình Environment Variables

### Bước 3: Truy cập Odoo
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

## 📁 Cấu trúc dự án

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
├── scripts/              # Deployment scripts
│   ├── setup.sh         # Setup ban đầu
│   ├── test-config.sh   # Test cấu hình
│   ├── deploy-render.sh # Deploy lên Render
│   └── deploy-fly.sh    # Deploy lên Fly.io
├── .github/
│   └── workflows/       # GitHub Actions CI/CD
└── QUICK_START.md       # Hướng dẫn chi tiết
```

## 🔧 Scripts có sẵn

- `./scripts/setup.sh` - Setup ban đầu
- `./scripts/test-config.sh` - Test cấu hình
- `./scripts/deploy-render.sh` - Deploy lên Render
- `./scripts/deploy-fly.sh` - Deploy lên Fly.io

## ⚙️ Cấu hình Environment Variables

Copy `env.example` thành `.env` và cập nhật:

```bash
# Database Configuration
HOST=localhost
PORT=5432
USER=odoo
PASSWORD=odoo
DATABASE=odoo

# Odoo Configuration
ADMIN_PASSWORD=admin
PROXY_MODE=True
```

## 🆘 Troubleshooting

### Lỗi build
- Kiểm tra `requirements.txt`
- Kiểm tra Dockerfile
- Xem logs trong platform dashboard

### Lỗi database
- Kiểm tra environment variables
- Kiểm tra kết nối database
- Restart service

### Lỗi timeout
- Tăng thời gian build trong platform settings
- Kiểm tra memory usage

## 📚 Tài liệu tham khảo

- [Odoo Documentation](https://www.odoo.com/documentation)
- [Render Documentation](https://render.com/docs)
- [Fly.io Documentation](https://fly.io/docs)
- [Railway Documentation](https://docs.railway.app)
- [Heroku Documentation](https://devcenter.heroku.com)

## 🎉 Kết quả

Sau khi triển khai thành công, bạn sẽ có:
- ✅ Odoo ERP system hoạt động trên cloud
- ✅ Database PostgreSQL được quản lý tự động
- ✅ CI/CD pipeline với GitHub Actions
- ✅ Monitoring và logging
- ✅ Backup tự động

---

**Chúc bạn triển khai thành công! 🚀**

> **Lưu ý**: Nếu bạn cần hỗ trợ, hãy tham khảo file `QUICK_START.md` để có hướng dẫn chi tiết hơn.