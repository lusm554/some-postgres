-- WHERE
select first_name, length(first_name) first_name_length, last_name
from customer
where 
  (first_name in ('Karen', 'Maria', 'Elizabeth', 'Margaret', 'Jennifer') or
  first_name like 'Ann%') and
  length(first_name) between 4 and 6 and
  last_name <> 'Hill'
order by first_name_length desc;

-- Limit
create or replace function ranint(
  min int default 1,
  max int default 50 
)
returns int
language plpgsql
as $$
begin
  return random()*(max - min) + min;
end $$;

-- get random count of rows
select first_name
from customer
order by customer_id
limit ranint() offset 5;

select 
  film_id,
  title,
  release_year
from
  film
order by 
  film_id
limit 5 offset 5;

-- FETCH
select film_id, title
from film
order by title
offset 4 row
fetch first 10 rows only;

-- IN
select 
  customer_id,
  rental_id,
  return_date
from
  rental
where customer_id in (1, 2)
order by return_date desc;

select 
  customer_id,
  first_name,
  last_name
from
  customer
where
  customer_id in (
    select customer_id
    from rental
    where return_date::date = '2005-05-27'
  )
order by customer_id;

-- BETWEEN
select 
  customer_id,
  payment_id,
  amount
  payment_date
from
  payment
where 
  payment_date between '2007-02-07' and '2007-02-15';

-- LIKE and ILIKE
select
  first_name,
  last_name
from
  customer
where
  first_name like '_re%';

select
  first_name,
  last_name
from
  customer
where first_name ilike 'CO%';

-- IS NULL 
select *
from contacts
where phone is null;

select *
from contacts
where phone is not null;

