-- | Normalize all tags to lowercase.
update tags
set tag_name = LOWER(tag_name)
where 1 = 1;
