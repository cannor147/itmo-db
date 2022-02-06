select distinct StudentId
from Students
where StudentId not in (select StudentId
                        from Marks
                        where Marks.CourseId in (select CourseId
                                                 from Plan
                                                 where Plan.GroupId = Students.GroupId
                                                   and LecturerId in (select LecturerId
                                                                      from Lecturers
                                                                      where LecturerName = :LecturerName)));
