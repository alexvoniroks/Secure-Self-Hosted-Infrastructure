# 🔐 WireGuard VPN Setup

## 📦 Configuration
- wgserver (LXC): `/etc/wireguard/wg0.conf`
- Android (Client): `.conf` or `.zip` imported via WireGuard app

### Server Config (10.8.0.1 / 192.168.x.x)
```ini
[Interface]
Address = 10.8.0.1/24
PrivateKey = <server-private-key>
ListenPort = 51820
PostUp = iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
PublicKey = <client-public-key>
AllowedIPs = 10.8.0.2/32
```

### Android Client Config
```ini
[Interface]
PrivateKey = <client-private-key>
Address = 10.8.0.2/24
DNS = 10.8.0.1

[Peer]
PublicKey = <server-public-key>
Endpoint = <public_ip>:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
```
