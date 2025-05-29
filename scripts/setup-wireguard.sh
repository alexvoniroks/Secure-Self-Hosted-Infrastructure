#!/bin/bash
# WireGuard setup script with iptables only

echo "[*] Installing WireGuard..."
apt update && apt install -y wireguard iptables-persistent

echo "[*] Enabling IP forwarding..."
echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p

echo "[*] Creating WireGuard config..."
mkdir -p /etc/wireguard
cp ./wg0.conf /etc/wireguard/wg0.conf
chmod 600 /etc/wireguard/wg0.conf

echo "[*] Setting up iptables NAT rules..."
iptables-save < ./iptables.rules
netfilter-persistent save

echo "[*] Starting WireGuard..."
systemctl enable wg-quick@wg0
systemctl start wg-quick@wg0
