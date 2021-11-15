-- Идентификаторы студентов, имеющих хотя бы один незачёт в журнале
select StudentId
from Marks
where Mark < 3;
