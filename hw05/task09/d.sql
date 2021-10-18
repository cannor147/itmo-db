select AvgAvgMark, GroupName
from Groups
         left outer join (select GroupId, coalesce(avg(cast(AvgMark as real)), 0) as AvgAvgMark
                          from (select GroupId, AvgMark
                                from (Students
                                         natural join (select StudentId, coalesce(avg(cast(Mark as real)), 0) as AvgMark
                                                       from Marks
                                                       group by StudentId) X)) X
                          group by GroupId) X on Groups.GroupId = X.GroupId;
