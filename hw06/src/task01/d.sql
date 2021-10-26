select StudentId
     , StudentName
     , GroupId
from Students
where StudentId in (select StudentId
                    from Marks
                    where Marks.Mark = :Mark
                      and CourseId in (select CourseId
                                       from Courses
                                       where CourseName = :CourseName));
