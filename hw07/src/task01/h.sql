delete
from Students
where StudentId not in (select Students.StudentId
                        from Students
                                 left outer join Plan
                                                 on Students.GroupId = Plan.GroupId
                                 left outer join Marks
                                                 on Plan.CourseId = Marks.CourseId and Students.StudentId = Marks.StudentId
                        where Marks.Mark is null
                        group by Students.StudentId
                        having count(distinct Plan.CourseId) > 2);
