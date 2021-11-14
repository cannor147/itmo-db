delete
from Students
where exists(select CourseId
             from Plan
             where Plan.GroupId = Students.GroupId
               and Plan.CourseId not in (select CourseId
                                         from Marks
                                         where Marks.StudentId = Students.StudentId));
