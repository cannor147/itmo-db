update Marks
set Mark = coalesce((select NewMarks.Mark
                     from NewMarks
                     where NewMarks.StudentId = Marks.StudentId
                       and NewMarks.CourseId = Marks.CourseId), Marks.Mark);
