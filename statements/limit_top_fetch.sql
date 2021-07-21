select * from test 
fetch first 3 rows only;

select * from test
limit 3;

-- select top 3 * from test; -- postgres not support

-- to select certain count of rows, we can use
-- select top 3 * from test;
-- or
-- select * from test limit 3;
-- or
-- select * from test fetch first 3 rows only;

