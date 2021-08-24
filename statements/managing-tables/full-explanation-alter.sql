-- RENAME TABLE

-- rename vendors to suppliers
alter table vendors
rename to suppliers;

-- add new column to the suppliers table named group_id. This column is the foreign key column that links to the id column of the supplier_groups table:
alter table suppliers
add column group_id int not null;

alter table suppliers
add foreign key (group_id) references supplier_groups (id);

alter table supplier_groups rename to groups;

-- ADD COLUMN

drop table if exists customers cascade;
create table customers (
  id serial primary key,
  customer_name varchar not null
);

-- The following statement uses the ALTER TABLE ADD COLUMN statement to add the phone column to the customers table:
alter table customers
add column phone varchar;

-- And the following statement adds the fax and email columns to the customers table:
alter table customers
add column fax varchar,
add column email varchar;

select * from customers;

-- add data to customers table
insert into
  customers (customer_name)
values
  ('Apple'),
  ('Samsung'),
  ('Sony');
/*
-- add contact_name column to the customers
alter table customers
add column contact_name varchar not null; -- throw error, this is because the contact_name column has the NOT NULL constraint.
*/
-- to solve problem

-- add column without not null
alter table customers
add column contact_name varchar;

-- update values
update customers
set contact_name = 'John Doe'
where id = 1;

update customers
set contact_name = 'Mary Doe'
where id = 2;

update customers
set contact_name = 'Lily Bush'
where id = 3;

-- set the not null constraint for the contact_name
alter table customers
alter column contact_name set not null;

select * from customers;

-- DROP COLUMN

-- remove category_id column from the books table
alter table books
drop column category_id;

select * from books 
limit 1;

-- remove publisher_id column
/*
alter table books
drop column publisher_id; -- It stated that the book_info view is using the column publisher_id of the books table.
*/
alter table books
drop column publisher_id cascade;

-- remove both isbn and description columns
alter table books
  drop column isbn,
  drop column description;

-- CHANGE COLUMN DATA TYPE

-- change the data type of the column to VARCHAR
alter table assets
alter column name type varchar;

-- change several columns data types from TEXT to VARCHAR
alter table assets
  alter column location type varchar,
  alter column description type varchar;

-- throw error "column "asset_no" cannot be cast automatically to type integer"
alter table assets
alter column asset_no type int;

-- with will work
alter table assets
alter column asset_no type int
using asset_no::int;

select * from assets;

-- RENAME COLUMN

-- rename one column
alter table customers
rename column email to contact_email;

-- rename column that has dependent objects
alter table customer_groups
rename column name to group_name;

-- multiple rename column
alter table customers
rename column name to customer_name;

alter table customers
rename column phone to contact_phone;

select * from customers;

