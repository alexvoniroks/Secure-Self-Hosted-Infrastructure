#!/bin/bash
# VM 2 Setup Script: App Server with Docker + FastAPI

set -e

echo "[*] Updating system..."
apt update && apt upgrade -y

echo "[*] Installing Docker and Docker Compose..."
apt install -y docker.io docker-compose

echo "[*] Creating application directory..."
mkdir -p /opt/fastapi-app

echo "[*] Creating sample FastAPI app..."
cat <<EOF > /opt/fastapi-app/main.py
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello from FastAPI on VM2"}
EOF

echo "[*] Creating Dockerfile..."
cat <<EOF > /opt/fastapi-app/Dockerfile
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

COPY ./main.py /app/main.py
EOF

echo "[*] Creating docker-compose.yml..."
cat <<EOF > /opt/fastapi-app/docker-compose.yml
version: "3.8"

services:
  fastapi:
    build: .
    ports:
      - "8000:8000"
    restart: always
EOF

echo "[*] Starting FastAPI container..."
cd /opt/fastapi-app
docker-compose up -d --build

echo "[*] FastAPI app deployed at http://<VM2-IP>:8000/"
