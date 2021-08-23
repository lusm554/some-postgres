/*
A sequence in PostgreSQL is a user-defined schema-bound object that generates a sequence of integers based on a specified specification. 
*/

/* Creating an ascending sequence example */
drop sequence if exists myseq;

-- This statement uses the CREATE SEQUENCE statement to create a new ascending sequence starting from 100 with an increment of 5:
create sequence myseq
increment 5
start 100;

-- get next value
select nextval('myseq');

-- If you execute the statement again, you will get the next value from the sequence:
select nextval('myseq');

/* Creating a descending sequence example */
drop sequence if exists three;

-- The following statement creates a descending sequence from 3 to 1 with the cycle option:
create sequence three
increment -1
minvalue 1
maxvalue 3
start 3
cycle;

do $$
begin
  for i in 1..10 loop
    raise notice '%', nextval('three');
  end loop;
end $$;

/* Creating a sequence associated with a table column */
drop sequence if exists order_item_id;
drop table if exists order_details;

create table order_details (
  order_id serial,
  item_id int not null,
  item_text varchar not null,
  price dec(10, 2) not null,
  primary key(order_id, item_id)
);

create sequence order_item_id
start 10
increment 10
minvalue 10
owned by order_details.item_id;

insert into
  order_details(order_id, item_id, item_text, price)
values
    (100, nextval('order_item_id'),'DVD Player',100),
    (100, nextval('order_item_id'),'Android TV',550),
    (100, nextval('order_item_id'),'Speaker',250);

select
  order_id,
  item_id,
  item_text,
  price
from
  order_details;

-- Listing all sequences in a database
select
  relname sequence_name
from
  pg_class
where
  relkind = 'S';


/* Deleting sequences */
-- If a sequence is associated with a table column, it will be automatically dropped once the table column is removed or the table is dropped.

drop sequence if exists seq;

