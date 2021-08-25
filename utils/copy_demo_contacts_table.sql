drop table if exists contacts;

create table contacts (
  id serial primary key,
  first_name varchar not null,
  last_name varchar not null,
  email varchar not null unique
);

insert into contacts (first_name, last_name, email)
values
  ('John','Doe','john.doe@postgresqltutorial.com'),
  ('David','William','david.william@postgresqltutorial.com');

