-- Индексируем одновременно и имя, и идентификатор группы
create index index_Students_Name_Groups on Students using btree (StudentName, GroupId);
