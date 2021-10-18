select SumMark, StudentName
from Students
         left outer join (select StudentId, coalesce(sum(Mark), 0) as SumMark
                          from Marks
                          group by StudentId) X on Students.StudentId = X.StudentId;
