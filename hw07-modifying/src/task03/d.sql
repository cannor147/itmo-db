update Students
set marks = (select count(distinct Marks.CourseId)
             from Marks
             where Students.StudentId = Marks.StudentId);
