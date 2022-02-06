-- Индексируем оценки, чтобы искать по ним в диапазоне
create index index_Marks_Student on Marks using btree (Mark);
