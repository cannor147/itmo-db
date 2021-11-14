merge into Marks
    using NewMarks
    on Marks.StudentId = NewMarks.StudentId and Marks.CourseId = NewMarks.CourseId
    when matched then update set Mark = case
                                            when Marks.Mark > NewMarks.Mark then Marks.Mark
                                            else NewMarks.Mark
        end
    when not matched then insert (StudentId, CourseId, Mark) values (NewMarks.StudentId, NewMarks.CourseId, NewMarks.Mark);
