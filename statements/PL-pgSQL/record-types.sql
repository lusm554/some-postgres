/*
- A record is a placeholder that can hold a single row of a result set.
- A record has not predefined structure like a row variable. Its structure is determined when you assign a row to it. 
*/

do $$
declare
  smth record;
begin
  -- name
  select name, city
  into smth
  from test
  where id = 3;
  raise notice '% %', smth.name, smth.city;
end; $$

