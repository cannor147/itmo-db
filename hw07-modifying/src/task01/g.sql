delete
from Students
where StudentId in (select Students.StudentId
                    from Students
                             natural join Plan
                             left outer join Marks
                                             on Plan.CourseId = Marks.CourseId and Students.StudentId = Marks.StudentId
                    where Marks.Mark is null
                    group by Students.StudentId
                    having count(distinct Plan.CourseId) >= 2);
