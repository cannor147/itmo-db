update Marks
set Mark = coalesce((select case
                                when NewMarks.Mark > Marks.Mark then NewMarks.Mark
                                else Marks.Mark
                                end
                     from NewMarks
                     where NewMarks.StudentId = Marks.StudentId
                       and NewMarks.CourseId = Marks.CourseId), Marks.Mark);
