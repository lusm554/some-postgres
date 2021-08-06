select
  e.first_name || ' ' || e.last_name employee,
  m.first_name || ' ' || m.last_name manager
from
  employee e
left join employee m
  on m.employee_id = e.manager_id
order by manager;

-- find all pair of films that have the same length
select
  f1.title,
  f2.title,
  f1.length
from 
  film f1
inner join film f2
  on f1.length = f2.length and f1.film_id != f2.film_id
limit 10;

