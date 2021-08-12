-- subquery
select
  film_id,
  title,
  rental_rate
from
  film
where
  rental_rate > (
    select 
      avg(rental_rate)
    from
      film
  );

-- subquery with IN operator
select
  film_id,
  title
from
  film
where
  film_id in (
    select
      i.film_id
    from
      rental r
    inner join inventory i
      on i.inventory_id = r.inventory_id
    where
      return_date between '2005-05-29' and '2005-05-30'
  )

-- EXISTS operator
select
  first_name,
  last_name
from
  customer c
where
  exists(
    select 1
    from
      payment p
    where
      p.customer_id = c.customer_id
  )

