-- add new row
insert into test (name)
values ('last');
select * from test;

-- update last row
update test
set name = concat('Nikita', (select max(id) from test)) -- join name and max id 
where id = (select count(*) from test); -- update last row in table
select * from test;
