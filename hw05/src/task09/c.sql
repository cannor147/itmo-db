select AvgMark, GroupName
from Groups
         left outer join (select GroupId, coalesce(avg(cast(Mark as real)), 0) as AvgMark
                          from Marks
                                   natural join Students
                          group by GroupId) X on Groups.GroupId = X.GroupId;
