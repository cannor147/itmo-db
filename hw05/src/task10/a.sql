select StudentId
     , coalesce(Total, 0)                       as Total
     , coalesce(Passed, 0)                      as Passed
     , coalesce(Total, 0) - coalesce(Passed, 0) as Failed
from Students
         left outer join (select StudentId as TotalStudentId, count(distinct CourseId) as Total
                          from Plan
                                   natural join Students
                          group by StudentId) X on Students.StudentId = X.TotalStudentId
         left outer join (select StudentId as PassedStudentId, count(Mark) as Passed
                          from Marks
                                   natural join Students
                                   natural join Plan
                          group by StudentId) Y on Students.StudentId = Y.PassedStudentId;
