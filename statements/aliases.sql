select name as "student name" from test;
select id, concat(name, ', ', id) as smth from test;

select t.name, m.age, m.address, m.phone
from test t, metadata m
where t.id = m.id;
