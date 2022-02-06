update Students
set debts = (select coalesce(Stats.CourseCount, 0)
             from Students as MyStudents
                      left outer join (select PlanStudents.StudentId        as StudentId
                                            , count(distinct Plan.CourseId) as CourseCount
                                       from Students as PlanStudents
                                                natural join Plan
                                                left outer join Marks
                                                                on Plan.CourseId = Marks.CourseId and
                                                                   PlanStudents.StudentId = Marks.StudentId
                                       where Marks.Mark is null
                                       group by PlanStudents.StudentId) Stats on MyStudents.StudentId = Stats.StudentId
             where MyStudents.StudentId = Students.StudentId)
where Students.StudentId = :StudentId;
