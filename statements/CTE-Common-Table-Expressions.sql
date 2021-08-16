-- CTE
with cte_film as (
  select
    film_id,
    title,
    (case
      when length < 30 then 'Short'
      when length < 90 then 'Medium'
      else 'Long'
    end) length
  from
    film
)
select
  film_id,
  title,
  length
from
  cte_film
where length = 'Long'
order by title
fetch first 10 rows only;

-- Joining a CTE with a table
with cte_rental as (
  select 
    staff_id,
    count(rental_id) rental_count
  from rental
  group by staff_id
)
select
  s.staff_id,
  first_name,
  last_name,
  rental_count
from
  staff s
inner join cte_rental c
  on c.staff_id = s.staff_id;

-- Using CTE with a window function
with cte_film as (
  select 
    film_id,
    title,
    rating,
    length,
    rank() over (
      partition by rating
      order by length desc
    ) length_rank
  from
    film
)
select *
from cte_film
limit 10;

with recursive subordinates as (
  select
    employee_id,
    manager_id,
    full_name
  from
    employees
  where
    employee_id = 2

  union

  select
    e.employee_id,
    e.manager_id,
    e.full_name
  from 
    employees e
  inner join subordinates s
    on s.employee_id = e.manager_id 
)
select *
from
  subordinates;

/* 
The following are some advantages of using common table expressions or CTEs:
 - Improve the readability of complex queries. You use CTEs to organize complex queries in a more organized and readable manner.
 - Ability to create recursive queries. 
 - Use in conjunction with window functions. You can use CTEs in conjunction with window functions to create an initial result set and use another select statement to further process this result set.
*/

