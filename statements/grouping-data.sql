-- GROUP BY without an aggregate function example
select
  customer_id
from 
  payment
group by
  customer_id
limit 5;

-- GROUP BY with SUM() function example
select
  customer_id,
  sum(amount)
from
  payment
group by 
  customer_id
order by
  sum(amount) desc
limit 10;

-- GROUP BY clause with the JOIN clause
select
  concat_ws(' ', first_name, last_name) full_name,
  sum(amount) amount
from
  payment p
inner join customer c
  on p.customer_id = c.customer_id
group by
  full_name
order by amount desc
limit 5;

-- GROUP BY with COUNT() function example
select
  staff_id,
  count(payment_id)
from
  payment
group by
  staff_id;

-- GROUP BY with multiple columns
select
  customer_id,
  staff_id,
  sum(amount)
from
  payment
group by
  staff_id,
  customer_id
order by customer_id;

-- GROUP BY clause with date column
select
  payment_date::date paid_date,
  sum(amount) sum
from 
  payment
group by
  payment_date::date;

-- HAVING clause
select
  customer_id,
  sum(amount)
from
  payment
group by 
  customer_id
having
  customer_id % 2 = 0
order by sum(amount)
limit 10;

select
  customer_id,
  sum(amount)
from
  payment
group by
  customer_id
having
  sum(amount) > 200;

select
  store_id,
  count(customer_id)
from
  customer
group by
  store_id
having
  count(customer_id) > 300;
