create view StudentDebts as
select Students.StudentId             as StudentId
     , coalesce(Stats.CourseCount, 0) as Debts
from Students
         left outer join (select Students.StudentId            as StudentId
                               , count(distinct Plan.CourseId) as CourseCount
                          from Students
                                   natural join Plan
                                   left outer join Marks
                                                   on Plan.CourseId = Marks.CourseId and Students.StudentId = Marks.StudentId
                          where Marks.Mark is null
                          group by Students.StudentId) Stats on Students.StudentId = Stats.StudentId;
