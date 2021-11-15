-- Индекс на внешний ключ таблицы Students
-- Поиск по данным о студенте и курсе
-- Поиск по данным о студенте, курсе и оценке
-- ДЗ-5.3.1. Информация о студентах с :Mark по предмету :CourseId
-- ДЗ-5.3.2. Информацию о студентах с :Mark по предмету :CourseName
-- ДЗ-5.3.3. Информацию о студентах с :Mark по предмету :LecturerId
create unique index fk_Marks_StudentId_CourseId_Mark on Marks using btree (StudentId, CourseId, Mark);

-- Индекс на внешний ключ таблицы Courses
-- Поиск по данным о курсе и студенте
-- Поиск по данным о курсе, студенте и оценке
-- ДЗ-5.5.2. ФИО студента и названия предметов которые у него есть без оценки
-- ДЗ-5.5.3. ФИО студента и названия предметов которые у него есть, но не 4 или 5
-- ДЗ-6.2.4. Полная информация о студентах, не имеющих оценки по :CourseId, у которых есть этот предмет
create unique index fk_Marks_CourseId_StudentId_Mark on Marks using btree (CourseId, StudentId, Mark);
