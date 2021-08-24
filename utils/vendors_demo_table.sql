drop table if exists vendors;
create table vendors (
  id serial primary key,
  name varchar not null
);

drop table if exists supplier_groups;
create table supplier_groups (
  id serial primary key,
  name varchar not null
);

