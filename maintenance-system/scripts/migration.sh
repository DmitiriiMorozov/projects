#!/bin/bash
set -e

# Параметры подключения
DB_HOST="localhost"
DB_USER="admin"
DB_NAME="maintenance"
export PGPASSWORD="secret"

# Применение DDL
psql -h $DB_HOST -U $DB_USER -d $DB_NAME -f database/ddl.sql

# Заполнение тестовыми данными
psql -h $DB_HOST -U $DB_USER -d $DB_NAME -f database/sample_data.sql

echo "Миграции применены!"