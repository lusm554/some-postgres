/*
Use row type variables (%ROWTYPE) to hold a row of a result set returned by the select into statement.
*/
do $$
declare
  select_test test%rowtype;
begin
  select *
  into select_test
  from test
  where id = 7;
  
  raise notice 'The test name - % and city - %',
    select_test.name,
    select_test.city;
end; $$
