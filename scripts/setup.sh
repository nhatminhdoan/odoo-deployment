#!/bin/bash
# Script setup cho Odoo deployment

set -e

echo "🚀 Bắt đầu setup Odoo deployment..."

# Kiểm tra Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker chưa được cài đặt. Vui lòng cài đặt Docker trước."
    exit 1
fi

# Kiểm tra Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose chưa được cài đặt. Vui lòng cài đặt Docker Compose trước."
    exit 1
fi

echo "✅ Docker và Docker Compose đã sẵn sàng"

# Tạo thư mục cần thiết
mkdir -p logs filestore sessions

# Set permissions
chmod 755 logs filestore sessions

# Copy file cấu hình mẫu nếu chưa có
if [ ! -f .env ]; then
    echo "📝 Tạo file .env từ .env.example..."
    cp .env.example .env
    echo "⚠️  Vui lòng chỉnh sửa file .env với thông tin database của bạn"
fi

# Build Docker image
echo "🔨 Building Docker image..."
docker build -t odoo-app .

echo "✅ Setup hoàn tất!"
echo ""
echo "📋 Các bước tiếp theo:"
echo "1. Chỉnh sửa file .env với thông tin database"
echo "2. Chạy: docker-compose up -d"
echo "3. Truy cập: http://localhost:8069"
echo ""
echo "🔧 Để deploy lên Render:"
echo "1. Push code lên GitHub"
echo "2. Kết nối với Render"
echo "3. Chọn repository và deploy"
