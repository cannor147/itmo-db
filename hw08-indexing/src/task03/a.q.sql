-- Полная информация о студентах, имеющих id в ISU в диапазоне
select StudentId
     , StudentName
     , GroupName
from Students
         natural join Groups
where StudentId >= 200000
  and StudentId < 299999;
