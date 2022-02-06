select StudentId
from (select StudentId, GroupId
      from Marks
               cross join (select *
                           from Plan
                                    natural join Lecturers
                           where LecturerName = :LecturerName) X
          except
      select StudentId, GroupId
      from (select X.CourseId, StudentId, GroupId
            from Marks
                     cross join (select *
                                 from Plan
                                          natural join Lecturers
                                 where LecturerName = :LecturerName) X
                except
            select X.CourseId, StudentId, GroupId
            from Marks
                     natural join (select *
                                   from Plan
                                            natural join Lecturers
                                   where LecturerName = :LecturerName) X) X) X
         natural join Students;
