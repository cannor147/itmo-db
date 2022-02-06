create view Debts as
select Students.StudentId            as StudentId
     , count(distinct Plan.CourseId) as Debts
from Students
         inner join Plan on Plan.GroupId = Students.GroupId
         left outer join Marks on Plan.CourseId = Marks.CourseId and Students.StudentId = Marks.StudentId
where Marks.Mark is null
group by Students.StudentId;
