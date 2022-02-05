## Домашнее задание 5. Реляционная алгебра

Структура базы данных «Университет»:

- *Students(StudentId, StudentName, GroupId)*
- *Groups(GroupId, GroupName)*
- *Courses(CourseId, CourseName)*
- *Lecturers(LecturerId, LecturerName)*
- *Plan(GroupId, CourseId, LecturerId)*
- *Marks(StudentId, CourseId, Mark)*



Составьте выражения реляционной алгебры и соответствующие SQL-запросы, позволяющие получать

1. Информацию о студентах
   1. С заданным идентификатором (*StudentId*, *StudentName*, *GroupId* по *:StudentId*).
   2. С заданным ФИО (*StudentId*, *StudentName*, *GroupId* по *:StudentName*).
2. Полную информацию о студентах
   1. С заданным идентификатором (*StudentId*, *StudentName*, *GroupName* по *:StudentId*).
   2. С заданным ФИО (*StudentId*, *StudentName*, *GroupName* по *:StudentName*).
3. Информацию о студентах с заданной оценкой по дисциплине
   1. С заданным идентификатором (*StudentId*, *StudentName*, *GroupId* по *:Mark*, *:CourseId*).
   2. С заданным названием (*StudentId*, *StudentName*, *GroupId* по *:Mark*, *:CourseName*).
   3. Которую у него вёл лектор заданный идентификатором (*StudentId*, *StudentName*, *GroupId* по *:Mark*, *:LecturerId*).
   4. Которую у него вёл лектор, заданный ФИО (*StudentId*, *StudentName*, *GroupId* по *:Mark*, *:LecturerName*).
   5. Которую вёл лектор, заданный идентификатором (*StudentId*, *StudentName*, *GroupId* по *:Mark*, *:LecturerId*).
   6. Которую вёл лектор, заданный ФИО (*StudentId*, *StudentName*, *GroupId* по *:Mark*, *:LecturerName*).
4. Информацию о студентах не имеющих оценки по дисциплине
   1. Среди всех студентов (*StudentId*, *StudentName*, *GroupId* по *:CourseName*).
   2. Среди студентов, у которых есть эта дисциплина (*StudentId*, *StudentName*, *GroupId* по *:CourseName*).
5. Для каждого студента ФИО и названия дисциплин
   1. Которые у него есть по плану (*StudentName*, *CourseName*).
   2. Есть, но у него нет оценки (*StudentName*, *CourseName*).
   3. Есть, но у него не 4 или 5 (*StudentName*, *CourseName*).
6. Идентификаторы студентов по преподавателю
   1. Имеющих хотя бы одну оценку у преподавателя (*StudentId* по *:LecturerName*).
   2. Не имеющих ни одной оценки у преподавателя (*StudentId* по *:LecturerName*).
   3. Имеющих оценки по всем дисциплинам преподавателя (*StudentId* по *:LecturerName*).
   4. Имеющих оценки по всем дисциплинам преподавателя, которые он вёл у этого студента (*StudentId* по *:LecturerName*).
7. Группы и дисциплины, такие что все студенты группы сдали эту дисциплину
   1. Идентификаторы (*GroupId*, *CourseId*).
   2. Названия (*GroupName*, *CourseName*).

Составьте SQL-запросы, позволяющие получать

1. Суммарный балл
   1. Одного студента (*SumMark* по *:StudentId*).
   2. Каждого студента (*StudentName*, *SumMark*).
   3. Каждой группы (*GroupName*, *SumMark*).
2. Средний балл
   1. Одного студента (*AvgMark* по *:StudentId*).
   2. Каждого студента (*StudentName*, *AvgMark*).
   3. Каждой группы (*GroupName*, *AvgMark*).
   4. Средний балл средних баллов студентов каждой группы (*GroupName*, *AvgAvgMark*).
3. Для каждого студента: число дисциплин, которые у него были, число сданных дисциплин и число несданных дисциплин (*StudentId*, *Total*, *Passed*, *Failed*).

#### Полезные ссылки

1. [Тестовый полигон](https://www.kgeorgiy.info/courses/dbms/homeworks.html#:~:text=Total%2C%20Passed%2C%20Failed).-,%D0%A2%D0%B5%D1%81%D1%82%D0%BE%D0%B2%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%BB%D0%B8%D0%B3%D0%BE%D0%BD,-%D0%A2%D0%B5%D1%85%D0%BD%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B5%20%D0%BE%D1%81%D0%BE%D0%B1%D0%B5%D0%BD%D0%BD%D0%BE%D1%81%D1%82%D0%B8%20%D0%BF%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B8)