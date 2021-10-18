select StudentId
     , StudentName
     , GroupId
from (select Mark, LecturerName, StudentId
      from Plan
               natural join Marks
               natural join Lecturers) X
         natural join Students
where Mark = :Mark
  and LecturerName = :LecturerName
  and Students.StudentId is not null;
