drop table if exists customer_groups;
drop table if exists customers;

create table customer_groups (
  id serial primary key,
  name varchar not null
);

create table customers (
  id serial primary key,
  name varchar not null,
  phone varchar not null,
  email varchar,
  group_id int,
  foreign key (group_id) references customer_groups (id)
);

create view customer_data
as
select
  c.id,
  c.name,
  g.name customer_group
from
  customers c
inner join customer_groups g on g.id = c.group_id;

