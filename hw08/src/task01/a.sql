-- Индекс на основной ключ таблицы Students
-- прим. не все базы данных создают индекс по PK по умолчанию
-- ДЗ-5.1.1. Информация о студентах по :StudentId
-- ДЗ-5.2.1. Полная информация о студентах по :StudentId
-- ДЗ-6.1.3. Информация о студентах по :Mark и :CourseId
create unique index pk_Students on Students using hash (StudentId);

-- Индекс на внешний ключ таблицы Groups
-- прим. не все базы данных создают индекс по FK по умолчанию
-- ДЗ-5.8.3. SumMark студентов каждой группы (GroupName)
-- ДЗ-5.9.3. AvgMark каждой группы (GroupName)
-- ДЗ-5.10. Статистика по студентам
create index fk_Students_Groups on Students using hash (GroupId);

-- Индекс нужен для поиска студентов по имени
-- Покрывающий индекс позволит не обращаться к самой таблице
-- ДЗ-5.1.2. Информация о студентах по :StudentName
-- ДЗ-5.2.2. Полная информация о студентах по :StudentName
-- ДЗ-6.1.1. Информация о студентах по :StudentName
create index index_Students_Name_Id on Students using btree (StudentName, StudentId);
