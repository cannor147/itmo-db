insert into Groups (group_id, group_name) values
	(1, 'M3437'),
	(2, 'M3436'),
	(3, 'M3438'),
	(4, 'M3439');

insert into Students (student_id, student_forename, student_surname, student_sex, group_id) values
	(1, 'Ерофей', 'Башунов', true, 2),
	(2, 'Дмитрий', 'Гнатюк', true, 4),
	(3, 'Денис', 'Трибрат', true, 1),
	(4, 'Юлия', 'Любавина', false, 2);
	
insert into Teachers (teacher_id, teacher_forename, teacher_surname, teacher_sex) values
	(1, 'Георгий', 'Корнеев', true),
	(2, 'Андрей', 'Станкевич', true),
	(3, 'Дмитрий', 'Штукенберг', true),
	(4, 'Михаил', 'Мирзаянов', true);
	
insert into Courses (course_id, course_name, semester, is_elective) values
	(1, 'Дискретная математика', 1, false),
	(2, 'Дискретная математика', 2, false),
	(3, 'Введение в программирование', 1, false),
	(4, 'Парадигмы программирования', 2, false),
	(5, 'Java Advanced', 4, false),
	(6, 'Базы данных', 7, false),
	(7, 'Теория типов', 5, false),
	(8, 'Математическая логика', 4, false),
	(9, 'Веб-программирование', 3, false);
	
insert into TeacherCourses (course_id, teacher_id, teacher_position) values
	(1, 2, 3),
	(2, 2, 3),
	(3, 1, 3),
	(4, 1, 3),
	(5, 1, 3),
	(5, 4, 2),
	(6, 1, 3),
	(7, 3, 3),
	(8, 3, 3),
	(9, 4, 3);
	
insert into CourseMembers (course_member_id, course_id, student_id, passed) values
	(1, 6, 1, false),
	(2, 6, 2, false),
	(3, 5, 3, true),
	(4, 5, 4, true);
	
insert into Marks (mark_id, course_member_id, points) values
	(1, 1, 98.00),
	(2, 2, 99.00),
	(3, 3, 96.00),
	(4, 4, 94.00);