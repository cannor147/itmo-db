# Уровни изоляции

## 1.1. FreeSeats

```sql
start transaction isolation level read uncommitted;
-- Здесь и далее будем считать, что вместо использования дополнительных
-- процедур в дз9, мы будем напрямую подставлять код, который в них написан.
-- Так же будем полагать, что для каждой процедуры написано решение,
-- не содержащее ошибок, даже если в решении дз9 они есть. Для пункта 1.8
-- будем полагать, что решение написано так же без ошибок с использованием
-- курсоров.
-- 
-- Косая запись нам не страшна, поскольку FreeSeats является read-only.
-- Фантомная запись не страшна, т.к. все чтения происходят из разных таблиц.
-- Неповторяемое чтение не страшно, т.к. каждую таблицу читаем один раз.
-- Грязное чтение не страшно, поскольку явных rollback у нас нигде нет,
-- -- а неявные могут произойти разве что из-за невыполнения constraints,
-- -- если мы их добавим (в дз9 нас это явно не просили сделать).
-- -- Однако во всех процедурах кроме 1.8 у нас лишь один запрос на изменение
-- -- всегда в самом конце, а в 1.8 уровень изоляции serializable, поэтому
-- -- для FreeSeats можно спокойно сделать уровень изоляции RU.
```

## 1.2. Reserve

```sql
start transaction isolation level read committed;
-- Косая запись нам не страшна, т.к. другие таблицы не могут изменяться,
-- -- ориентируясь на данные из таблицы Passengers (идеологически).
-- Фантомная запись не страшна, т.к. все чтения происходят из разных таблиц.
-- Неповторяемое чтение не страшно, т.к. каждую таблицу читаем один раз.
-- А вот грязное чтение страшно, т.к. мы можем пытаться вставить запись,
-- -- ориентируясь на неверное состояние данных (например, если попытались
-- -- удалить бронь, а потом rollback'нулись).
```

## 1.3. ExtendReservation

```sql
start transaction isolation level read committed;
-- Косая запись нам не страшна, т.к. другие таблицы не могут изменяться,
-- -- ориентируясь на данные из таблицы Passengers (идеологически).
-- Фантомная запись не страшна, т.к. все чтения происходят из разных таблиц.
-- Неповторяемое чтение не страшно, т.к. каждую таблицу читаем один раз.
-- А вот грязное чтение страшно, т.к. мы можем пытаться изменить запись,
-- -- ориентируясь на неверное состояние данных (например, если попытались
-- -- удалить бронь, а потом rollback'нулись).
```

## 1.4. BuyFree

```sql
start transaction isolation level serializable;
-- Косая запись опасна, поскольку при одновременной покупке двух
-- -- билетов на одно и то же место, мы спокойно сможем это сделать,
-- -- однако вернуть true нам хочется лишь единожды.
```

## 1.5. BuyReserved

```sql
start transaction isolation level read committed;
-- Аналогично с 1.3.
```

## 1.6. FlightsStatistics

```sql
start transaction isolation level read committed;
-- По аналогии с 1.1, косая запись, фантомная запись и неповторяемое чтение
-- -- нам не страшны.
-- Однако поскольку FlightsStatistics принимает помимо неизменяемого поля
-- -- (UserId) ещё и изменяемое (Pass), то стоит грязное чтение уже может
-- -- быть опасным, поскольку нам могут попытаться изменить пароль.
```

## 1.7. FlightStat

```sql
start transaction isolation level read committed;
-- Аналогично с 1.6.
```

## 1.8. CompressSeats

```sql
start transaction isolation level serializable;
-- Косая запись по своему определению опасна для CompressSeats,
-- -- так как CompressSeats допускает множественное изменение записей.
```

