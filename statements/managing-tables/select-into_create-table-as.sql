-- SELECT INTO
/*
The PostgreSQL SELECT INTO statement creates a new table and inserts data returned from a query into the table.

The new table will have columns with the names the same as columns of the result set of the query. Unlike a regular SELECT statement, the SELECT INTO statement does not return a result to the client. 
*/

drop table if exists film_r;

-- The following statement creates a new table called film_r that contains films with the rating R and rental duration 5 days from the film table.
select
  film_id,
  title,
  rental_rate
into table 
  film_r
from
  film
where
  rating = 'R' and
  rental_duration = 5
order by
  title;

-- The following statement creates a temporary table named short_film that contains the films whose lengths are under 60 minutes.
select
  film_id,
  title,
  length
into temp table
  short_film
from
  film
where
  length < 60
order by
  title;

select * from short_film;

-- CREATE TABLE AS
/*
The CREATE TABLE AS statement creates a new table and fills it with the data returned by a query. 
*/

-- The following statement creates a table that contains action films that belong to category one.
create table if not exists action_film as
select
  f.film_id,
  title,
  release_year,
  length,
  rating
from
  film f
inner join film_category ft
  on f.film_id = ft.film_id
where
  category_id = 1;

select * from action_film
order by title;

-- This example statement created a new table film_rating and filled it with the summary data from the film table. It explicitly specified the column names for the new table instead of using the column names from the SELECT clause.
create table if not exists film_rating (rating, film_count) 
as
select
  rating,
  count(film_id)
from
  film
group by
  rating;

select * from film_rating;

