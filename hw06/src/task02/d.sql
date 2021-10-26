select StudentId
     , StudentName
     , GroupName
from Students
   , Groups
where Students.GroupId = Groups.GroupId
  and StudentId not in (select StudentId
                        from Marks
                        where Marks.CourseId = :CourseId)
  and Students.GroupId in (select GroupId
                           from Plan
                           where Plan.CourseId = :CourseId);
