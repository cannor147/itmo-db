update Students
set GroupId = coalesce((select min(Groups.GroupId)
                        from Groups
                        where Groups.GroupName = :GroupName)
    , Students.GroupId)
where GroupId in (select FromGroups.GroupId
                  from Groups as FromGroups
                  where FromGroups.GroupName = :FromGroupName);
