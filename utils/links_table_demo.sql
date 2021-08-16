drop table if exists links;
create table links (
  id serial primary key,
  url varchar(255) not null,
  name varchar(255) not null,
  description varchar(255),
  last_update date
);

