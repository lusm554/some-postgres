drop table if exists links;

create table links (
  link_id serial primary key,
  title varchar (512) not null,
  url varchar (1024) not null
);

