-- Соединение Plan с Students по GroupId
-- прим. не все базы данных создают индекс по FK по умолчанию
create unique index fk_Students_Groups on Students using hash (GroupId);

-- Соединения Plan, Students с Marks по CourseId и StudentId
create unique index fk_Marks_Courses_Students on Marks using btree (CourseId, StudentId);

-- Соединение Plan c Groups по GroupId
-- прим. не все базы данных создают индекс по PK по умолчанию
create unique index pk_Groups on Groups using hash (GroupId);

-- Ускорение поиска по :GroupName
create unique index index_Groups_Name on Groups using btree (GroupName);

-- Соединение Plan c Courses по CourseId
-- прим. не все базы данных создают индекс по PK по умолчанию
create unique index pk_Courses on Courses using hash (CourseId);

-- Ускорение поиска по :CourseName
create unique index index_Course_Name on Courses using btree (CourseName);
