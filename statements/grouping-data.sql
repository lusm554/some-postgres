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
