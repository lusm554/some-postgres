select
  inventory_id,
  f.film_id,
  title
from
  film f
left join inventory i
  on f.film_id = i.film_id
where i.film_id is null -- films that are not in the inventory
order by title;

