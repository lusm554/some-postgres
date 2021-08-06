select 
  c.customer_id,
  first_name,
  last_name,
  amount,
  payment_date
from
  customer c
inner join payment p
-- since both tables have same filed, u can use the using(customed_id)
-- inner join using(customer_id)
  on c.customer_id = p.customer_id
order by payment_date
limit 10;

select
  c.customer_id,
  c.first_name c_first_name,
  c.last_name c_last_name,
  s.first_name s_first_name,
  s.last_name s_last_name,
  amount,
  payment_date
from 
  customer c
inner join payment p
  on p.customer_id = c.customer_id
inner join staff s
  on p.staff_id = s.staff_id
order by payment_date
limit 10;
