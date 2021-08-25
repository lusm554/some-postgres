-- DROP TABLE

-- Drop a table that does not exist
select * from author; -- throw an error

drop table if exists author; -- throw notice


-- Drop a table that has dependent objects
drop table if exists authors;
drop table if exists pages;

create table authors (
  author_id int primary key,
  firstname varchar (50),
  lastname varchar (50)
);

create table pages (
  page_id serial primary key,
  title varchar (255) not null,
  contents text,
  author_id int not null,
  foreign key (author_id)
    references authors (author_id)
);

drop table if exists authors; -- cannot drop table authors because other objects depend on it

drop table if exists authors cascade;

-- drop multiple tables
create table tvshows (
  tvshow_id int generated always as identity,
  title varchar,
  release_year smallint,
  primary key(tvshow_id)
);

create table animes (
  anime_id int generated always as identity,
  title varchar,
  release_year smallint,
  primary key(anime_id)
);

-- drop several tables
drop table tvshows, animes;

-- TRUNCATE TABLE
/*
  To remove all data from a table, you use the DELETE statement. However, when you use the DELETE 
statement to delete all data from a table that has a lot of data, it is not efficient. In this case,
you need to use the TRUNCATE TABLE statement. 
  The  TRUNCATE TABLE statement deletes all data from a table without scanning it. This is the reason
why it is faster than the DELETE statement.
  In addition, the TRUNCATE TABLE statement reclaims the storage right away so you do not have to 
perform a subsequent VACUMM operation, which is useful in the case of large tables.
*/

-- simple truncate
truncate table table_name;

-- truncate with reset the values in the identity column 
truncate table table_name
restart identity;

-- several tables
truncate
  table_name1,
  table_name2,
  table_name3;

-- remove data from a table and other tables that have foreign key reference the table
truncate table table_name
cascade;

-- TEMPORARY TABLE
drop table if exists customers cascade;
create table customers (
  id serial primary key,
  name varchar not null
);

create temp table customers (
  customer_id int
);

select * from customers; -- This time PostgreSQL accessed the temporary table customers instead of the permanent one.

-- remove temp table
drop table customers;

-- COPY TABLE

-- copy contacts
create table contact_backup
as table contacts;

select * from contact_backup; -- same structure and data as in contacts

-- add primary key
alter table contact_backup add primary key(id);
alter table concat_backup add unique (email);

