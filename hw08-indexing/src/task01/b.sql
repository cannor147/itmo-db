-- Индекс на основной ключ таблицы Groups
-- прим. не все базы данных создают индекс по PK по умолчанию
-- ДЗ-5.2.1. Полная информация о студентах по :StudentId
-- ДЗ-5.2.2. Полная информация о студентах по :StudentName
create unique index pk_Groups on Groups using hash (GroupId);

-- Индекс нужен для поиска групп по имени
-- Покрывающий индекс позволит не обращаться к самой таблице
-- ДЗ-7.1.2. Удаление студентов по :GroupName
-- ДЗ-7.2.4. Перевод всех студентов группы по :*GroupName
-- ДЗ-7.2.5. Перевод всех студентов в существующую группу
create unique index index_Groups_Name_Id on Groups using btree (GroupName, GroupId);
