select SumMark, GroupName
from Groups
         left outer join (select GroupId, coalesce(sum(Mark), 0) as SumMark
                          from Marks
                                   natural join Students
                          group by GroupId) X on Groups.GroupId = X.GroupId;
