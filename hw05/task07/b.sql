select CourseName, GroupName
from (select CourseId, GroupId
      from Marks
               cross join Students
          except
      select CourseId, GroupId
      from (select Students.StudentId, CourseId, GroupId
            from Marks
                     cross join Students
                except
            select Students.StudentId, CourseId, GroupId
            from Marks
                     natural join Students) X) X
         natural join Courses
         natural join Groups;
