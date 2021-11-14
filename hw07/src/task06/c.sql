-- PostgreSQL (ver. 12.4)

create or replace function processPreserveMarks() returns trigger as
$preserveMarks$
begin
    if new.Mark < old.Mark then
        return old;
    else
        return new;
    end if;
end;
$preserveMarks$ language plpgsql;

create trigger PreserverMarks
    before update
    on Marks
    for each row
execute procedure processPreserveMarks();
