# 🛠️ Network Setup

This guide outlines the network configuration for the secure VPN infrastructure project.

## 🧱 Network Topology

```
+-------------------+         +------------------------+
| Android (Client)  | <--->   | WireGuard VPN Server   |  <-- Port 51820/UDP forwarded from router
| (10.8.0.2)        |         | wgserver: 10.8.0.1 / 192.168.x.x |
+-------------------+         +------------------------+
                                      |
                        +-------------+-------------+
                        |      Proxmox Bridge (vmbr0)       |
                        +-------------+-------------+
                                      |            |             |
                         +----------------+ +------------------+ +------------------+
                         | webproxy (VM)   | | appserver (VM)     | | database (VM)     |
                         | 10.8.0.10 /     | | 192.168.x.x        | | 192.168.x.x        |
                         | 192.168.x.x     | | Docker + FastAPI   | | PostgreSQL + backups|
                         | Nginx + iptables| +------------------+ +------------------+
                         +----------------+
```

## 🔍 IP Summary
| Hostname   | Type | LAN IP       | VPN IP     | Services                                |
|------------|------|--------------|------------|-----------------------------------------|
| `webproxy` | VM   | 192.168.x.x  | 10.8.0.10  | Nginx reverse proxy, HTTPS, iptables     |
| `appserver`| VM   | 192.168.x.x  | —          | Docker-hosted FastAPI app                |
| `database` | VM   | 192.168.x.x  | —          | PostgreSQL DB with backups               |
| `wgserver` | LXC  | 192.168.x.x  | 10.8.0.1   | WireGuard VPN server with NAT & routing  |
