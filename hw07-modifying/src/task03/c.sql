update Students
set marks = marks + (select count(NewMarks.Mark)
                     from NewMarks
                     where Students.StudentId = NewMarks.StudentId);
