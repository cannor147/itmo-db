insert into Marks (StudentId, CourseId, Mark)
select NewMarks.StudentId
     , NewMarks.CourseId
     , NewMarks.Mark
from NewMarks
         left outer join Marks as OldMarks
                         on NewMarks.StudentId = OldMarks.StudentId and NewMarks.CourseId = OldMarks.CourseId
where OldMarks.Mark is null;
