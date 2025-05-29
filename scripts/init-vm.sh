#!/bin/bash
# Basic VM initialization script without UFW

echo "[*] Updating system..."
apt update && apt upgrade -y

echo "[*] Installing essentials..."
apt install -y curl vim git iptables iptables-persistent
