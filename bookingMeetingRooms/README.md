## Описание проекта
___
**Название:** Документация REST API для системы бронирования переговорных комнат в офисе
**Цель:** Описать архитектуру REST API с помощью YAML, описать сценарии взаимодействия пользователей с системой, создать документацию, понятную для разработчиков.
**Роль:** Системный аналитик.
**Инструменты:** Swagger, YAML, REST API.

## Общая бизнес-логика
___
Система позволяет сотрудникам компании бронировать переговорные комнаты.
Пользователь может:
 - Просмотреть список переговорок
 - Забронировать комнату на конкретную дату и время
 - Отменить бронирование
 - Просмотреть свои брони
 - Оставить отзыв о комнате

## Сущности и связи
___

| Сущность  | Описание                          |
| --------- | :-------------------------------- |
| `User`    | Пользователь, бронирующий комнату |
| `Room`    | Переговорная комната              |
| `Booking` | Запись о бронировании             |
| `Review`  | Отзыв пользователя о комнате      |
### Основные связи:
- Пользователь может создать много `Booking`
- Комната может быть забронирована многими `Users`
- Один `Review` относится к `User` и `Room`

## Методы API (таблица)
___

| Метод    | URL                      | Назначение                         |
| -------- | ------------------------ | ---------------------------------- |
| `GET`    | `/rooms`                 | Получить список переговорок        |
| `GET`    | `/rooms/{room_id}`       | Получить данные по комнате         |
| `POST`   | `/bookings`              | Создать бронирование               |
| `GET`    | `/bookings?user_id=X`    | Получить бронирования пользователя |
| `DELETE` | `/bookings/{booking_id}` | Отменить бронирование              |
| `POST`   | `/reviews`               | Оставить отзыв                     |

##  Примеры API-запросов и ответов

---

### **Создание бронирования (POST /bookings)**

**Запрос:**

```json
{
  "user_id": 1,
  "room_id": 2,
  "date": "2025-04-20",
  "start_time": "10:00",
  "end_time": "11:30"
}
```

**Ответ (200 OK):**

```json
{
  "booking_id": 321,
  "status": "confirmed"
}
```

**Ответ (400 Bad Request):**

```json
{
  "error": "Комната уже занята на это время"
}
```

---

###  **Получение списка переговорок (GET /rooms)**

**Ответ:**

```json
[
  {
    "room_id": 1,
    "name": "Синяя переговорка",
    "location": "Этаж 3",
    "capacity": 6
  },
  {
    "room_id": 2,
    "name": "Красная переговорка",
    "location": "Этаж 4",
    "capacity": 8
  }
]
```

---

###  **Получение бронирований пользователя (GET /bookings?user_id=3)**

**Ответ:**

```json
[
  {
    "booking_id": 92,
    "room_name": "Зелёная переговорка",
    "date": "2025-04-15",
    "start_time": "10:00",
    "end_time": "11:00"
  }
]
```

---

###  **Удаление бронирования (DELETE /bookings/{id})**

**Ответ:**

```json
{
  "message": "Бронирование успешно отменено"
}
```

---

###  **Оставить отзыв (POST /reviews)**

**Запрос:**

```json
{
  "user_id": 4,
  "room_id": 2,
  "rating": 5,
  "comment": "Очень удобная комната и хорошее оборудование"
}
```

**Ответ:**

```json
{
  "review_id": 88,
  "status": "published"
}
```

---
## Формат Swagger
Swagger-документация реализована в виде YAML-файла:
- Поддерживает все методы
- Примеры запросов/ответов
- Описание параметров, схем
[[swagger.yaml](https://github.com/DmitiriiMorozov/projects/blob/main/bookingMeetingRooms/swagger/swagger.yaml)]
![swaggerImg](https://github.com/DmitiriiMorozov/projects/blob/main/bookingMeetingRooms/other/images/swaggerImg.png)
## Итоги
___
- **Проект представляет собой полноценную документацию REST API для системы бронирования переговорных комнат**, что включает описание бизнес-логики, основных сущностей и их связей, а также методов API.
- **Документация структурирована и включает все необходимые элементы**, такие как описание сущностей (`User`, `Room`, `Booking`, `Review`), их связи, а также примеры запросов и ответов для каждого метода.
- **Использование инструментов Swagger и YAML** позволяет обеспечить совместимость с современными стандартами и инструментами разработки API, что делает документацию удобной для разработчиков.
- **Проект охватывает ключевые аспекты разработки и использования API**, такие как создание, получение, отмену бронирований и добавление отзывов, что делает его полезным и актуальным для реальных приложений.
- **Документация предоставляет чёткие и понятные примеры запросов и ответов**, что повышает её доступность и простоту использования для разработчиков.
