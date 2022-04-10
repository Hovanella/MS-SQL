use H_MYBASE_
ALTER Table РАБОТНИКИ ADD ПОЛ nchar(1) default 'm' check (ПОЛ in ('м','ж'));
