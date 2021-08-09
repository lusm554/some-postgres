-- GROUPING SETS

-- it defines a grouping set of the brand and segment which is denoted by (brand, segement)
select
  brand,
  segment,
  sum(quantity)
from
  sales
group by
  brand,
  segment;

-- It defines a grouping set (brand)
select
  brand,
  sum(quantity)
from
  sales
group by
  brand;

--  It defines a grouping set (segment)
select
  segment,
  sum(quantity)
from
  sales
group by
  segment;

-- It defines an empty grouping set which is denoted by ()
select sum(quantity) from sales;

-- Suppose that you want to all the grouping sets by using a single query
select
  brand,
  segment,
  sum(quantity)
from
  sales
group by
  brand,
  segment

union all

select
  brand,
  null,
  sum(quantity)
from
  sales
group by
  brand

union all

select
  null,
  segment,
  sum(quantity)
from
  sales
group by
  segment

union all

select
  null,
  null,
  sum(quantity)
from
  sales;

-- To make it more efficient, PostgreSQL provides the GROUPING SETS clause which is the subclause of the GROUP BY clause.

select
  brand,
  segment,
  sum(quantity)
from
  sales
group by
  grouping sets(
    (brand, segment),
    (brand),
    (segment),
    ()
  );

-- The GROUPING() function returns bit 0 if the argument is a member of the current grouping set and 1 otherwise.
select
  grouping(brand) grp_brand,
  grouping(segment) grp_segment,
  brand,
  segment,
  sum(quantity)
from
  sales
group by
  grouping sets(
    (brand),
    (segment),
    ()
  )
order by
  brand,
  segment;

-- find the subtotal of each brand like this
select
  grouping(brand) grp_brand,
  grouping(segment) grp_segment,
  brand,
  segment,
  sum(quantity)
from
  sales
group by
  grouping sets(
    (brand),
    (segment),
    ()
  )
having grouping(brand) = 0
order by
  brand,
  segment;

-- CUBE

-- The following query uses the CUBE subclause to generate multiple grouping sets
select
  brand,
  segment,
  sum(quantity)
from
  sales
group by
  cube(brand, segment)
order by
  brand,
  segment;

-- The following query performs a partial cube:
select
  brand,
  segment,
  sum(quantity)
from
  sales
group by
  brand,
  cube(segment)
order by
  brand,
  segment;

-- ROLLUP

-- The following query uses the ROLLUP clause to find the number of products sold by brand (subtotal) and by all brands and segments (total)
select
  brand,
  segment,
  sum(quantity)
from
  sales
group by
  rollup(brand, segment)
order by 
  brand,
  segment;

-- The following statement performs a partial roll-up
select
  segment,
  brand,
  sum(quantity)
from
  sales
group by
  segment,
  rollup(brand)
order by
  segment,
  brand;

select
  extract(year from rental_date) y,
  extract(month from rental_date) m,
  extract(day from rental_date) d,
  count(rental_id)
from
  rental
group by
  rollup (
    extract(year from rental_date),
    extract(month from rental_date),
    extract(day from rental_date)
  );
