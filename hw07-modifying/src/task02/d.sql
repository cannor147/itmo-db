update Students
set GroupId = (select min(Groups.GroupId)
               from Groups
               where Groups.GroupName = :GroupName)
where GroupId in (select FromGroups.GroupId
                  from Groups as FromGroups
                  where FromGroups.GroupName = :FromGroupName);
