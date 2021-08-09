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

