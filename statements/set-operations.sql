select * from top_rated_films;
select * from most_popular_films;

-- UNION

-- UNION examples
-- combine data from both tables and remove duplicate
select * from top_rated_films
union
select * from most_popular_films;

-- UNION ALL example
-- combine data from both tables without removing duplicates
select * from top_rated_films
union all
select * from most_popular_films;

-- UNION ALL with ORDER BY clause example 
select * from top_rated_films
union all
select * from most_popular_films
order by title;

-- INTERSECT Operator

-- The result set returns one film that appears on both tables.
select * from most_popular_films
intersect
select * from top_rated_films;

-- EXCEPT Operator

select * from top_rated_films
except
select * from most_popular_films
order by title;
