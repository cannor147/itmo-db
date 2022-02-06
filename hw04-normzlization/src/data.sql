insert into Groups (groupId, groupName) values
	(1, 'M3435'),
	(2, 'M3436'),
	(3, 'M3438'),
	(4, 'M3439');

insert into Students (studentId, studentName, groupId) values
	(1, 'Ерофей Башунов', 2),
	(2, 'Алексей Плешаков', 4),
	(3, 'Галина Григорьева', 1),
	(4, 'Сергей Балахнин', 2);
	
insert into Lecturers (lecturerId, lecturerName) values
	(1, 'Георгий Корнеев'),
	(2, 'Андрей Станкевич'),
	(3, 'Дмитрий Штукенберг'),
	(4, 'Михаил Мирзаянов');
	
insert into Courses (courseId, courseName) values
	(1, 'Дискретная математика'),
	(2, 'Дискретная математика'),
	(3, 'Введение в программирование'),
	(4, 'Парадигмы программирования'),
	(5, 'Java Advanced'),
	(6, 'Базы данных'),
	(7, 'Теория типов'),
	(8, 'Математическая логика'),
	(9, 'Веб-программирование');
	
insert into Teaching (courseId, groupId, lecturerId) values
	(6, 1, 1),
	(6, 2, 1),
	(6, 3, 1),
	(6, 4, 1);
	
insert into Marks (studentId, courseId, mark) values
	(1, 6, 100.00),
	(2, 6, 100.00),
	(3, 6, 100.00),
	(4, 6, 100.00);
