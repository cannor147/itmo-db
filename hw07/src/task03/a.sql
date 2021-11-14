update Students
set marks = (select count(Marks.Mark)
             from Marks
             where Students.StudentId = Marks.StudentId)
where Students.StudentId = :StudentId;
