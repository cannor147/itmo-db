-- Информация о студентах 4 курса КТ, которые могут являться преподавателями или их тёзками
select StudentId
     , StudentName
     , GroupId
from Lecturers
         inner join Students on Lecturers.LecturerName = Students.StudentName
where GroupId in (select GroupId
                  from Groups
                  where Groups.GroupName like 'M34%');
