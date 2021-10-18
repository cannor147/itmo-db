select StudentId
     , StudentName
     , GroupId
from (select Mark, LecturerId, StudentId
      from Plan
               natural join Marks) X
         natural join Students
where Mark = :Mark
  and LecturerId = :LecturerId
  and Students.StudentId is not null;
