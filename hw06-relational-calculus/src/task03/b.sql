select StudentName
     , CourseName
from Students
   , Courses
where StudentId in (select StudentId
                    from Students
                       , Plan
                    where Students.GroupId = Plan.GroupId
                      and Plan.CourseId = Courses.CourseId
                    union
                    select StudentId
                    from Marks
                    where Marks.CourseId = Courses.CourseId);
