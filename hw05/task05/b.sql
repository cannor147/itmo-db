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
                  natural join Marks) X
         natural join Students
         natural join Courses;
