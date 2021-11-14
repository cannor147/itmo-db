create view AllMarks as
select Students.StudentId                                        as StudentId
     , coalesce(OldMarks.Marks, 0) + coalesce(NewMarks.Marks, 0) as Marks
from Students
         left outer join (select Marks.StudentId, count(Marks.Mark) as Marks
                          from Marks
                          group by Marks.StudentId) as OldMarks on Students.StudentId = OldMarks.StudentId
         left outer join (select NewMarks.StudentId, count(NewMarks.Mark) as Marks
                          from NewMarks
                          group by NewMarks.StudentId) as NewMarks on Students.StudentId = NewMarks.StudentId;
