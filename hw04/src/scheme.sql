create table Groups (
	groupId int primary key,
	groupName varchar(10) not null,
	unique (groupName)
);
create table Students (
	studentId int primary key,
	studentName varchar(50) not null,
	groupId int not null
);
create table Lecturers (
	lecturerId int primary key,
	lecturerName varchar(50) not null
);
create table Courses (
	courseId int primary key,
	courseName varchar(100) not null
);
create table Teaching (
	groupId int not null,
	courseId int not null,
	lecturerId int not null,
	primary key (groupId, courseId)
);
create table Marks (
	studentId int not null,
	courseId int not null,
	mark decimal(5, 2) not null,
	primary key (studentId, courseId)
);

alter table Marks		add constraint ch_marks_mark check (mark >= 0 AND mark <= 100);
alter table Marks		add foreign key (studentId) references Students (studentId);
alter table Marks		add foreign key (courseId) references Courses (courseId);
alter table Students	add foreign key (groupId) references Groups (groupId);
alter table Teaching	add foreign key (groupId) references Groups (groupId);
alter table Teaching	add foreign key (courseId) references Courses (courseId);
alter table Teaching	add foreign key (lecturerId) references Lecturers (lecturerId);
