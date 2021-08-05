select
  c.customer_id,
  first_name,
  amount,
  payment_date
from
  customer c
inner join payment p
  on p.customer_id = c.customer_id
order by
  payment_date desc
limit 15;

