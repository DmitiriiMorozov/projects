#!/bin/bash
set -e

# Установка Docker
apt-get update
apt-get install -y docker.io

# Запуск PostgreSQL
docker run -d --name maintenance-db \
  -e POSTGRES_PASSWORD=secret \
  -e POSTGRES_USER=admin \
  -e POSTGRES_DB=maintenance \
  -p 5432:5432 \
  postgres:13

# Применение миграций
sleep 10
psql -h localhost -U admin -d maintenance -f database/ddl.sql
psql -h localhost -U admin -d maintenance -f database/sample_data.sql

echo "Deploy завершен!"