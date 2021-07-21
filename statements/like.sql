select * from test
where name like 'a%' or name like 'A%';

select * from test
where name like '_i%';

-- % represents zero, one, or multiple characters
-- _ represents one, single character
