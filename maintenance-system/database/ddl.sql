-- Создание таблицы 'equipment'
CREATE TABLE equipment (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  inventory_number TEXT UNIQUE NOT NULL,
  location TEXT,
  installed_at DATE,
  status TEXT CHECK (status IN ('active', 'decommissioned', 'storage'))
);

-- Создание таблицы 'maintenance_type'
CREATE TABLE maintenance_type (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Создание таблицы 'contractor'
CREATE TABLE contractor (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  contact_name TEXT,
  phone TEXT,
  email TEXT
);

-- Создание таблицы 'user' (в кавычках, так как user — зарезервированное слово)
CREATE TABLE "user" (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  role TEXT CHECK (role IN ('admin', 'manager', 'viewer')),
  email TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL
);

-- Создание таблицы 'maintenance_task'
CREATE TABLE maintenance_task (
  id SERIAL PRIMARY KEY,
  equipment_id INT REFERENCES equipment(id),
  contractor_id INT REFERENCES contractor(id),
  user_id INT REFERENCES "user"(id),
  type_id INT REFERENCES maintenance_type(id),
  status TEXT CHECK (
    status IN (
      'planned', 
      'in_progress', 
      'completed', 
      'overdue', 
      'canceled', 
      'awaiting_review'
    )
  ),
  planned_date DATE,
  completed_date DATE,
  description TEXT
);

-- Создание таблицы 'notification'
CREATE TABLE notification (
  id SERIAL PRIMARY KEY,
  task_id INT REFERENCES maintenance_task(id),
  type TEXT CHECK (type IN ('email', 'sms', 'web')),
  sent_at TIMESTAMP,
  message TEXT
);

-- Создание таблицы 'act'
CREATE TABLE act (
  id SERIAL PRIMARY KEY,
  task_id INT UNIQUE REFERENCES maintenance_task(id),
  act_number TEXT,
  file_url TEXT,
  signed_at DATE
);