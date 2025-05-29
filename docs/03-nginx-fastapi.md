# 🌐 Nginx + FastAPI Setup

## 🔧 Nginx Config (webproxy: 10.8.0.10 / 192.168.x.x)
```nginx
server {
    listen 443 ssl;
    server_name _;

    ssl_certificate /etc/nginx/certs/fullchain.pem;
    ssl_certificate_key /etc/nginx/certs/privkey.pem;

    location / {
        proxy_pass http://192.168.x.x:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

## 🚀 FastAPI (appserver: 192.168.x.x)
```yaml
services:
  fastapi:
    image: my-fastapi-app
    ports:
      - "8000:8000"
    networks:
      - internal

networks:
  internal:
    driver: bridge
```
