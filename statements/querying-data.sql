-- Select
select 
  concat_ws(' ', first_name, last_name) as full_name,
  email 
from 
  customer
limit 1;

select 5 * 3 as some_math;

-- Column Alias
select country_id id from country
limit 5;

select film_id as id from film
limit 5;

select first_name, last_name surname from customer
limit 3;

-- ORDER BY
select * from actor
order by actor_id desc
limit 10;

-- returns first letter of text
create or replace function f_letter(str text)
returns text
language plpgsql
as $$
begin
  return substr(str, 1, 1);
end $$;

select 
  concat_ws(' ', first_name, last_name) full_name
from 
  customer
order by f_letter(first_name), f_letter(last_name)
limit 7;

select first_name, length(first_name) len from customer
order by len desc
limit 10;

select * from sort_demo
order by num desc nulls last;
-- SELECT DISTINCT
select 
  count(distinct first_name) uniq_names, 
  count(first_name) all_names 
from customer;

select 
  distinct bcolor,
  fcolor
from 
  distinct_demo
order by bcolor;

select distinct on (bcolor) bcolor, fcolor
from distinct_demo
order by bcolor, fcolor; 







