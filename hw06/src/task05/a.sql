select distinct Students.StudentId
from Students
   , Marks
where Students.StudentId = Marks.StudentId
  and Marks.CourseId in (select CourseId
                         from Plan
                         where Plan.GroupId = Students.GroupId
                           and LecturerId in (select LecturerId
                                              from Lecturers
                                              where LecturerName = :LecturerName));
