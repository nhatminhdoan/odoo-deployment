#!/bin/bash
# Script test cấu hình Odoo

set -e

echo "🧪 Testing Odoo configuration..."

# Kiểm tra Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker không được cài đặt"
    exit 1
fi

# Kiểm tra Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose không được cài đặt"
    exit 1
fi

echo "✅ Docker và Docker Compose sẵn sàng"

# Test Dockerfile
echo "🔨 Testing Dockerfile..."
if docker build -t odoo-test .; then
    echo "✅ Dockerfile build thành công"
else
    echo "❌ Dockerfile build thất bại"
    exit 1
fi

# Test Docker Compose
echo "🐳 Testing Docker Compose..."
if docker-compose config > /dev/null; then
    echo "✅ Docker Compose config hợp lệ"
else
    echo "❌ Docker Compose config không hợp lệ"
    exit 1
fi

# Test requirements
echo "📦 Testing requirements..."
if python3 -c "import sys; sys.path.append('.'); import odoo"; then
    echo "✅ Odoo module có thể import"
else
    echo "⚠️  Odoo module không thể import (có thể cần cài đặt dependencies)"
fi

# Test configuration files
echo "⚙️  Testing configuration files..."

# Kiểm tra odoo.conf
if [ -f "config/odoo.conf" ]; then
    echo "✅ config/odoo.conf tồn tại"
else
    echo "❌ config/odoo.conf không tồn tại"
fi

# Kiểm tra render.yaml
if [ -f "render.yaml" ]; then
    echo "✅ render.yaml tồn tại"
else
    echo "❌ render.yaml không tồn tại"
fi

# Kiểm tra fly.toml
if [ -f "fly.toml" ]; then
    echo "✅ fly.toml tồn tại"
else
    echo "❌ fly.toml không tồn tại"
fi

# Kiểm tra env.example
if [ -f "env.example" ]; then
    echo "✅ env.example tồn tại"
else
    echo "❌ env.example không tồn tại"
fi

echo ""
echo "🎉 Test hoàn tất!"
echo ""
echo "📋 Các bước tiếp theo:"
echo "1. Chạy: ./scripts/setup.sh"
echo "2. Chỉnh sửa file .env"
echo "3. Chạy: docker-compose up -d"
echo "4. Truy cập: http://localhost:8069"
