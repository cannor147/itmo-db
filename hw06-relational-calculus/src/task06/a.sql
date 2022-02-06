select distinct GroupId
              , CourseId
from Groups
   , Courses
where not exists(select Students.StudentId
                 from Students
                 where Students.GroupId = Groups.GroupId
                   and StudentId not in (select StudentId
                                         from Marks
                                         where Marks.CourseId = Courses.CourseId));
