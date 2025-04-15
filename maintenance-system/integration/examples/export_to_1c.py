import os
import requests
from lxml import etree
from sqlalchemy import create_engine, text
from dotenv import load_dotenv

# Загрузка конфига
load_dotenv("config.env")

# Конфигурация
DB_URL = os.getenv("DB_URL")
API_1C_URL = os.getenv("API_1C_URL")
API_KEY = os.getenv("API_KEY")
XSD_PATH = "integration/xsd/maintenance_task.xsd"

def export_to_1c(task_id: int):
    """Экспорт задачи в 1C"""
    engine = create_engine(DB_URL)
    
    try:
        with engine.connect() as conn:
            # Получение данных задачи
            query = text("""
                SELECT 
                    mt.id, mt.planned_date, mt.status,
                    e.inventory_number, e.name as equipment_name,
                    c.id as contractor_id, c.name as contractor_name,
                    a.act_number, a.signed_at
                FROM maintenance_task mt
                LEFT JOIN equipment e ON mt.equipment_id = e.id
                LEFT JOIN contractor c ON mt.contractor_id = c.id
                LEFT JOIN act a ON mt.id = a.task_id
                WHERE mt.id = :task_id
            """)
            task = conn.execute(query, {"task_id": task_id}).fetchone()

        # Генерация XML
        root = etree.Element("MaintenanceTasks")
        task_elem = etree.SubElement(root, "Task")
        
        etree.SubElement(task_elem, "ExternalID").text = str(task.id)
        etree.SubElement(task_elem, "PlannedDate").text = task.planned_date.isoformat()
        etree.SubElement(task_elem, "Status").text = task.status
        
        equipment = etree.SubElement(task_elem, "Equipment")
        etree.SubElement(equipment, "InventoryNumber").text = task.inventory_number
        etree.SubElement(equipment, "Name").text = task.equipment_name
        
        contractor = etree.SubElement(task_elem, "Contractor")
        etree.SubElement(contractor, "ID").text = str(task.contractor_id)
        etree.SubElement(contractor, "Name").text = task.contractor_name
        
        if task.act_number:
            act = etree.SubElement(task_elem, "Act")
            etree.SubElement(act, "Number").text = task.act_number
            etree.SubElement(act, "SignedAt").text = task.signed_at.isoformat()

        # Валидация по XSD
        schema = etree.XMLSchema(etree.parse(XSD_PATH))
        schema.assertValid(root)

        # Отправка в 1C
        response = requests.post(
            API_1C_URL,
            data=etree.tostring(root, encoding="utf-8"),
            headers={
                "Content-Type": "application/xml",
                "X-API-Key": API_KEY
            },
            timeout=10
        )
        response.raise_for_status()
        print(f"Задача {task_id} успешно экспортирована!")

    except Exception as e:
        print(f"Ошибка: {str(e)}")

if __name__ == "__main__":
    export_to_1c(123)