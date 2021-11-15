select avg(Mark)
from Plan
         natural join Students
         natural join Marks
         natural join Groups
         natural join Courses
where GroupName = :GroupName
  and CourseName = :CourseName;
