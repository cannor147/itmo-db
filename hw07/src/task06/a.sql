-- PostgreSQL (ver. 12.4)

create or replace function processCheckNoExtraMarks() returns trigger as
$checkNoExtraMarks$
begin
    if new.CourseId in (select CourseId
                        from Plan
                        where Plan.GroupId in
                              (select GroupId
                               from Students
                               where Students.StudentId = new.StudentId)) then
        return new;
    else
        return null;
    end if;
end;
$checkNoExtraMarks$ language plpgsql;

create or replace function processCheckNoStudentsWithExtraMarks() returns trigger as
$checkNoStudentsWithExtraMarks$
begin
    if exists(select CourseId
              from Marks
              where Marks.StudentId = new.StudentId
                and Marks.CourseId not in (select CourseId
                                           from Plan
                                           where Plan.GroupId = new.GroupId)) then
        return null;
    else
        return new;
    end if;
end;
$checkNoStudentsWithExtraMarks$ language plpgsql;

create or replace function processCheckNoPlanWithExtraMarks() returns trigger as
$checkNoPlanWithExtraMarks$
begin
    if exists(select StudentId
              from Students
              where Students.GroupId = new.GroupId
                and Students.StudentId not in (select StudentId
                                               from Marks
                                               where Marks.CourseId = new.CourseId)) then
        return null;
    else
        return new;
    end if;
end;
$checkNoPlanWithExtraMarks$ language plpgsql;

create or replace function processCheckNoPlanWithExtraMarks2() returns trigger as
$checkNoPlanWithExtraMarks2$
begin
    if new.GroupId <> old.GroupId and exists(select StudentId
                                             from Students
                                                      natural join Marks
                                             where Students.GroupId = old.GroupId
                                               and Marks.CourseId not in (select CourseId
                                                                          from Plan
                                                                          where Plan.GroupId = old.GroupId)) then
        return old;
    else
        if new.CourseId <> old.CourseId and exists(select StudentId
                                                   from Students
                                                            natural join Marks
                                                   where Marks.CourseId = old.CourseId
                                                     and Students.GroupId not in (select GroupId
                                                                                  from Plan
                                                                                  where Plan.CourseId = old.CourseId)) then
            return old;
        else
            return new;
        end if;
    end if;
end;
$checkNoPlanWithExtraMarks2$ language plpgsql;

create or replace function processCheckNoPlanWithExtraMarks3() returns trigger as
$checkNoPlanWithExtraMarks3$
begin
    if exists(select StudentId
              from Students
                       natural join Marks
              where Students.GroupId = old.GroupId
                and Marks.CourseId not in (select CourseId
                                           from Plan
                                           where Plan.GroupId = old.GroupId)) then
        return old;
    else
        if exists(select StudentId
                  from Students
                           natural join Marks
                  where Marks.CourseId = old.CourseId
                    and Students.GroupId not in (select GroupId
                                                 from Plan
                                                 where Plan.CourseId = old.CourseId)) then
            return old;
        else
            return null;
        end if;
    end if;
end;
$checkNoPlanWithExtraMarks3$ language plpgsql;

create trigger NoExtraMarks
    before update or insert
    on Marks
    for each row
execute procedure processCheckNoExtraMarks();

create trigger NoStudentsWithExtraMarks
    before update or insert
    on Students
    for each row
execute procedure processCheckNoStudentsWithExtraMarks();

create trigger NoPlanWithExtraMarks
    before update or insert
    on Plan
    for each row
execute procedure processCheckNoPlanWithExtraMarks();

create trigger NoPlanWithExtraMarks2
    before update
    on Plan
    for each row
execute procedure processCheckNoPlanWithExtraMarks2();

create trigger NoPlanWithExtraMarks3
    before delete
    on Plan
    for each row
execute procedure processCheckNoPlanWithExtraMarks3();
