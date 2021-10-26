select StudentId
     , StudentName
     , GroupId
from Students
where StudentId in (select StudentId
                    from Marks
                    where Marks.CourseId = :CourseId
                      and Marks.Mark = :Mark);
