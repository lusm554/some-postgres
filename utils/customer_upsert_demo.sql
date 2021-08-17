create table customers (
  customer_id serial primary key,
  name varchar unique,
  email varchar not null,
  active bool not null default true
);

insert into customers (
  name,
  email
)
values
    ('IBM', 'contact@ibm.com'),
    ('Microsoft', 'contact@microsoft.com'),
    ('Intel', 'contact@intel.com');

