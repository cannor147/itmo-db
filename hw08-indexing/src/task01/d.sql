-- Индекс на основной ключ таблицы Lecturers
-- прим. не все базы данных создают индекс по PK по умолчанию
-- ДЗ-5.3.4. Информацию о студентах с :Mark по предмету :LecturerName
-- ДЗ-5.6.1. StudentId имеющих хотя бы одну оценку у :LecturerName
-- ДЗ-5.6.2. StudentId не имеющих оценок у :LecturerName
create unique index pk_Lecturers on Lecturers using hash (LecturerId);

-- Индекс нужен для поиска преподавателей по имени
-- Покрывающий индекс позволит не обращаться к самой таблице
-- ДЗ-5.3.4. Информацию о студентах с :Mark по предмету :LecturerName
-- ДЗ-5.6.1. StudentId имеющих хотя бы одну оценку у :LecturerName
-- ДЗ-5.6.2. StudentId не имеющих оценок у :LecturerName
create unique index index_Lecturers_Name_Id on Lecturers using btree (LecturerName, LecturerId);
