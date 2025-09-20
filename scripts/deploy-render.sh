#!/bin/bash
# Script deploy lên Render

set -e

echo "🚀 Deploying Odoo lên Render..."

# Kiểm tra git status
if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️  Có thay đổi chưa commit. Vui lòng commit trước khi deploy."
    git status
    read -p "Bạn có muốn commit tất cả thay đổi? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git add .
        git commit -m "Deploy: $(date)"
    else
        echo "❌ Deploy bị hủy"
        exit 1
    fi
fi

# Push lên GitHub
echo "📤 Pushing code lên GitHub..."
git push origin main

echo "✅ Code đã được push lên GitHub"
echo ""
echo "📋 Các bước tiếp theo trên Render:"
echo "1. Truy cập https://render.com"
echo "2. Đăng nhập và kết nối GitHub"
echo "3. Tạo PostgreSQL Database:"
echo "   - Name: odoo-db"
echo "   - Database: odoo"
echo "   - User: odoo"
echo "   - Region: Singapore"
echo "4. Tạo Web Service:"
echo "   - Connect GitHub repository"
echo "   - Build Command: pip install -r requirements.txt"
echo "   - Start Command: python3 odoo-bin -c config/odoo.conf"
echo "   - Port: 8069"
echo "5. Thêm Environment Variables:"
echo "   - HOST: <database_host>"
echo "   - PORT: <database_port>"
echo "   - USER: odoo"
echo "   - PASSWORD: <database_password>"
echo "   - DATABASE: odoo"
echo ""
echo "🎉 Sau khi deploy xong, truy cập URL được cung cấp bởi Render"
