# 🚀 Hướng dẫn Push lên GitHub

## Bước 1: Tạo Repository mới trên GitHub

1. Truy cập [GitHub.com](https://github.com)
2. Click "New repository" (nút + ở góc trên bên phải)
3. Đặt tên: `odoo-deployment` hoặc `my-odoo-app`
4. Chọn "Public" hoặc "Private"
5. **KHÔNG** tích "Initialize with README"
6. Click "Create repository"

## Bước 2: Thay đổi remote origin

Sau khi tạo repository, chạy các lệnh sau:

```bash
# Xóa remote origin cũ
git remote remove origin

# Thêm remote mới (thay YOUR_USERNAME và YOUR_REPO_NAME)
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# Push lên repository mới
git push -u origin deployment-setup
```

## Bước 3: Tạo Pull Request (tùy chọn)

Nếu muốn merge vào main branch:

```bash
# Chuyển về main branch
git checkout main

# Merge deployment-setup
git merge deployment-setup

# Push main branch
git push origin main
```

## Bước 4: Deploy lên Render

Sau khi push thành công:

1. Truy cập [render.com](https://render.com)
2. Đăng ký/đăng nhập
3. Click "New +" → "Web Service"
4. Kết nối với GitHub repository vừa tạo
5. Chọn branch `deployment-setup`
6. Render sẽ tự động detect `render.yaml`
7. Click "Create Web Service"

## Bước 5: Tạo Database

1. Trong Render dashboard, click "New +" → "PostgreSQL"
2. Đặt tên: `odoo-db`
3. Database: `odoo`
4. User: `odoo`
5. Region: Singapore
6. Plan: Starter (miễn phí)
7. Click "Create Database"

## Bước 6: Cấu hình Environment Variables

1. Vào Web Service → Environment
2. Thêm các biến:
   ```
   HOST=<database_host_from_render>
   PORT=<database_port_from_render>
   USER=odoo
   PASSWORD=<database_password_from_render>
   DATABASE=odoo
   ```

## Bước 7: Deploy

1. Click "Manual Deploy" → "Deploy latest commit"
2. Chờ 5-10 phút để build và deploy
3. Truy cập URL được cung cấp

## 🎉 Kết quả

Sau khi hoàn thành, bạn sẽ có:
- ✅ Repository GitHub với tất cả cấu hình deployment
- ✅ Odoo chạy trên Render
- ✅ Database PostgreSQL được quản lý tự động
- ✅ CI/CD pipeline với GitHub Actions

---

**Lưu ý**: Thay `YOUR_USERNAME` và `YOUR_REPO_NAME` bằng thông tin thực tế của bạn.
