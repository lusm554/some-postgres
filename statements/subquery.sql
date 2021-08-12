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

-- ANY Operator
select title
from film
where length >= any(
  select max(length)
  from film
  inner join film_category using(film_id) -- on film.film_id = film_category.film_id
  group by category_id
);

-- ALL Operator
select
  film_id,
  title,
  length
from
  film
where length > all(
  select
    round(avg(length), 2)
  from
    film
  group by rating
)
order by
  length;

-- exist
select
  first_name,
  last_name
from
  customer c
where exists(
  select 1
  from 
    payment p
  where p.customer_id = c.customer_id and
    amount > 11)
order by
  first_name, last_name;

-- not exist
select
  first_name,
  last_name
from
  customer c
where not exists(
  select 1
  from 
    payment p
  where p.customer_id = c.customer_id and
    amount > 11)
order by
  first_name, last_name;

-- If the subquery returns NULL, EXISTS returns true
select
  first_name,
  last_name
from
  customer
where
  exists(select null)
order by
  first_name,
  last_name;

