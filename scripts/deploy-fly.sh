#!/bin/bash
# Script deploy lên Fly.io

set -e

echo "🚀 Deploying Odoo lên Fly.io..."

# Kiểm tra flyctl
if ! command -v flyctl &> /dev/null; then
    echo "❌ flyctl chưa được cài đặt. Vui lòng cài đặt trước:"
    echo "curl -L https://fly.io/install.sh | sh"
    exit 1
fi

# Login vào Fly.io
echo "🔐 Đăng nhập vào Fly.io..."
flyctl auth login

# Tạo app nếu chưa có
if [ ! -f .fly/app.toml ]; then
    echo "📱 Tạo Fly.io app..."
    flyctl apps create odoo-app --generate-name
fi

# Deploy
echo "🚀 Deploying..."
flyctl deploy

echo "✅ Deploy hoàn tất!"
echo ""
echo "📋 Các bước tiếp theo:"
echo "1. Tạo PostgreSQL database:"
echo "   flyctl postgres create --name odoo-db --region sin"
echo "2. Attach database:"
echo "   flyctl postgres attach odoo-db"
echo "3. Set environment variables:"
echo "   flyctl secrets set HOST=<database_host>"
echo "   flyctl secrets set PORT=<database_port>"
echo "   flyctl secrets set USER=postgres"
echo "   flyctl secrets set PASSWORD=<database_password>"
echo "   flyctl secrets set DATABASE=odoo"
echo "4. Restart app:"
echo "   flyctl apps restart odoo-app"
echo ""
echo "🌐 Truy cập: https://odoo-app.fly.dev"
