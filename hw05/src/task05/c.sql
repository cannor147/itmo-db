select StudentName, CourseName
from (
         select StudentId, CourseId
         from Students
                  natural join Plan
                  natural join Courses
             except
         select StudentId, CourseId
         from Plan
                  natural join Courses
                  natural join Marks
         where Mark = 4
            or Mark = 5) X
         natural join Students
         natural join Courses;
