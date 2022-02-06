-- Индекс на внешний ключ таблицы Groups
-- Поиск по данным о группе и курсе
-- Поиск по данным о группе, курсе и преподавателе
-- ДЗ-5.3.3. Информацию о студентах с :Mark по предмету :LecturerId
-- ДЗ-5.3.4. Информацию о студентах с :Mark по предмету :LecturerName
-- ДЗ-5.10. Статистика по студентам
create unique index fk_Plan_Groups_Courses_Lecturers on Plan using btree (GroupId, CourseId, LecturerId);

-- Индекс на внешний ключ таблицы Courses
-- Поиск по данным о курсе и преподавателе
-- fk_Plan_Groups_Courses_Lecturers требует вдобавок ещё GroupId
-- ДЗ-6.2.4. Полная информация о студентах, не имеющих оценки по :CourseId, у которых есть этот предмет
create index fk_Plan_Courses_Lecturers on Plan using btree (CourseId, LecturerId);

-- Индекс на внешний ключ таблицы Lecturers
-- прим. не все базы данных создают индекс по PK по умолчанию
-- Запросы не требуют этого индекса, однако его стоит добавить
create index fk_Plan_Lecturers on Plan using btree (LecturerId);
