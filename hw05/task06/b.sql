select StudentId
from Students
    except
select distinct StudentId
from Students
         natural join Plan
         natural join Marks
         natural join Lecturers
where LecturerName = :LecturerName;
