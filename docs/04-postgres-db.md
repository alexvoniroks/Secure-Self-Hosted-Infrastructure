# 🗃️ PostgreSQL Setup

## 🔐 Security (192.168.x.x)
- `listen_addresses = 'localhost'`
- Strong passwords and `md5` auth in `pg_hba.conf`

## 📦 Backup
```cron
0 3 * * * pg_dump -U myuser mydb > /backups/mydb_$(date +\%F).sql
```
