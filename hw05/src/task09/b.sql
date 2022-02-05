select AvgMark, StudentName
from Students
         left outer join (select StudentId, coalesce(avg(cast(Mark as real)), 0) as AvgMark
                          from Marks
                          group by StudentId) X on Students.StudentId = X.StudentId;
