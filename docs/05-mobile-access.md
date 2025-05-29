# 📱 Mobile Access

## 📲 WireGuard App (Android)
- Imports `.conf` file with endpoint `<public_ip>:51820`
- VPN IP: `10.8.0.2`

## 🔍 Access Flow
```
Android (10.8.0.2)
   │
   ▼
WireGuard VPN Tunnel to wgserver (10.8.0.1 / 192.168.x.x)
   │
   ▼
NAT → LAN (192.168.x.x/24)
   │
   ▼
webproxy (10.8.0.10 / 192.168.x.x)
   │
   ▼
proxy_pass → appserver (192.168.x.x:8000)
   │
   ▼
FastAPI → database (192.168.x.x)
```
