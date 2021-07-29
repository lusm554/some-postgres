-- Use the select into statement to select data from the database and assign it to a variable.

do $$
declare
  people_count int;
begin
  select count(id)
  into people_count
  from test;
  
  raise notice 'People count in test table %', people_count;
end; $$
