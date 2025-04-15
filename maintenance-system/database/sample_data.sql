-- Добавление оборудования
INSERT INTO equipment (name, inventory_number, location, installed_at, status)
VALUES 
  ('Насос X200', 'INV-001', 'Цех №1', '2023-01-15', 'active'),
  ('Кондиционер Y300', 'INV-002', 'Офис', '2023-03-20', 'storage');

-- Добавление типов ТО
INSERT INTO maintenance_type (name)
VALUES 
  ('Регламентное'),
  ('Внеплановое');

-- Добавление подрядчиков
INSERT INTO contractor (name, contact_name, phone, email)
VALUES 
  ('ООО ТехСервис', 'Иванов А.А.', '+74951234567', 'contact@techservice.ru'),
  ('ИП Сергеев', 'Сергеев П.П.', '+74957654321', 'sergeev@mail.ru');

-- Добавление пользователей
INSERT INTO "user" (name, role, email, password_hash)
VALUES 
  ('Петров И.И.', 'admin', 'admin@company.com', 'hash1'),
  ('Сидорова М.М.', 'manager', 'manager@company.com', 'hash2');

-- Добавление задач ТО
INSERT INTO maintenance_task (
  equipment_id, contractor_id, user_id, type_id, 
  status, planned_date, completed_date, description
)
VALUES 
  (1, 1, 1, 1, 'completed', '2023-12-01', '2023-12-05', 'Замена фильтров'),
  (2, 2, 2, 2, 'in_progress', '2023-12-10', NULL, 'Чистка кондиционера');

-- Добавление уведомлений
INSERT INTO notification (task_id, type, sent_at, message)
VALUES 
  (1, 'email', '2023-12-01 09:00:00', 'Новая задача: Насос X200');

-- Добавление актов
INSERT INTO act (task_id, act_number, file_url, signed_at)
VALUES 
  (1, 'ACT-2023-001', 'https://storage.com/act1.pdf', '2023-12-05');