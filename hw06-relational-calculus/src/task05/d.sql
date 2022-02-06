select StudentId
from Students
where not exists(select CourseId
                 from Plan
                 where LecturerId in (select LecturerId
                                      from Lecturers
                                      where LecturerName = :LecturerName)
                   and Plan.GroupId = Students.GroupId
                   and CourseId not in (select CourseId
                                        from Marks
                                        where Marks.StudentId = Students.StudentId));
