create view StudentMarks as
select Students.StudentId as StudentId
     , count(Mark)        as Marks
from Students
         left outer join Marks on Students.StudentId = Marks.StudentId
group by Students.StudentId;
