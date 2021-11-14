update Students
set debts = (select coalesce(Stats.CourseCount, 0)
             from Students as MyStudents
                      left outer join (select Students.StudentId            as StudentId
                                            , count(distinct Plan.CourseId) as CourseCount
                                       from Students
                                                natural join Plan
                                                left outer join Marks
                                                                on Plan.CourseId = Marks.CourseId and Students.StudentId = Marks.StudentId
                                       where Marks.Mark is null
                                       group by Students.StudentId) Stats on MyStudents.StudentId = Stats.StudentId
             where MyStudents.StudentId = Students.StudentId)
where Students.GroupId in (select GroupId
                           from Groups
                           where GroupName = :GroupName);
