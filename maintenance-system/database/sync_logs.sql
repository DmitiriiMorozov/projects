-- Создание таблицы для логов синхронизации с 1C
CREATE TABLE sync_logs (
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status TEXT CHECK (status IN ('success', 'error')),
  error_message TEXT,
  payload TEXT
);

-- Пример записи в логи
INSERT INTO sync_logs (status, error_message, payload)
VALUES 
  ('error', 'Invalid date format', '<MaintenanceTasks>...</MaintenanceTasks>'),
  ('success', NULL, '<MaintenanceTasks>...</MaintenanceTasks>');