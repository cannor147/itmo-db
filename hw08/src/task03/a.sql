-- Индексируем id, чтобы искать по ним в диапазоне
create index index_Students_Id on Students using btree (StudentId);
