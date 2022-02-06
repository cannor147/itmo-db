create table Groups (
	group_id int primary key,
	group_name varchar(10) not null,
	unique (group_name)
);
create table Students (
	student_id int primary key,
	student_forename varchar(50) not null,
	student_surname varchar(50) not null,
	student_sex boolean not null,
	group_id int not null
);
create table Teachers (
	teacher_id int primary key,
	teacher_forename varchar(50) not null,
	teacher_surname varchar(50) not null,
	teacher_sex boolean not null
);
create table Courses (
	course_id int primary key,
	course_name varchar(100) not null,
	semester int not null,
	is_elective boolean not null
);
create table CourseMembers (
	course_member_id int primary key,
	student_id int not null,
	course_id int not null,
	passed boolean not null
);
create table TeacherCourses (
	teacher_id int not null,
	course_id int not null,
	teacher_position int not null,
	primary key (teacher_id, course_id)
);
create table Marks (
	mark_id int primary key,
	course_member_id int not null,
	points decimal(5, 2) not null
);

alter table Marks
	add constraint ch_marks_points check (points >= 0 AND points <= 100),
	add foreign key (course_member_id) references CourseMembers (course_member_id);
alter table Students
	add foreign key (group_id) references Groups (group_id);
alter table CourseMembers
	add foreign key (student_id) references Students (student_id),
	add foreign key (course_id) references Courses (course_id);
alter table TeacherCourses
	add foreign key (course_id) references Courses (course_id),
	add foreign key (teacher_id) references Teachers (teacher_id);