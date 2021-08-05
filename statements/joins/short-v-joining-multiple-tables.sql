-- inner join
select
  a,
  fruit_a,
  b,
  fruit_b
from
  basket_a
inner join basket_b
  on fruit_a = fruit_b;

-- left join
select
  a,
  fruit_a,
  b,
  fruit_b
from
  basket_a
left join basket_b
  on fruit_a = fruit_b
where b is null;

-- right join
select
  a,
  fruit_a,
  b,
  fruit_b
from
  basket_a
right join basket_b on fruit_a = fruit_b;
--where a is null;

-- full outer join
select
  a,
  fruit_a,
  b,
  fruit_b
from
  basket_a
full outer join basket_b
  on fruit_a = fruit_b;
  -- return rows in a table that do not have matching rows in the other
--where a is null or b is null;

