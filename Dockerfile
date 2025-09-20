# Dockerfile đơn giản cho Odoo deployment
FROM python:3.11-slim

# Cài đặt system dependencies cơ bản
RUN apt-get update && apt-get install -y \
    postgresql-client \
    build-essential \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    libjpeg-dev \
    zlib1g-dev \
    libfreetype6-dev \
    liblcms2-dev \
    libwebp-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libxcb1-dev \
    libldap2-dev \
    libsasl2-dev \
    libevent-dev \
    && rm -rf /var/lib/apt/lists/*

# Tạo user odoo
RUN adduser --system --home=/opt/odoo --group odoo

# Tạo thư mục cần thiết
RUN mkdir -p /opt/odoo/addons /opt/odoo/filestore /opt/odoo/sessions

# Copy source code
COPY --chown=odoo:odoo . /opt/odoo/

# Cài đặt Python dependencies
RUN pip install --no-cache-dir -r /opt/odoo/requirements.txt

# Cấu hình Odoo
USER odoo
WORKDIR /opt/odoo

# Expose port
EXPOSE 8069

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD python3 -c "import requests; requests.get('http://localhost:8069/web/health', timeout=5)" || exit 1

# Command để chạy Odoo
CMD ["python3", "odoo-bin", "-c", "/opt/odoo/config/odoo.conf"]
