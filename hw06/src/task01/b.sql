select Students.StudentId
     , Students.StudentName
     , Students.GroupId
from Students
   , Groups
where Groups.GroupName = :GroupName
  and Students.GroupId = Groups.GroupId;
