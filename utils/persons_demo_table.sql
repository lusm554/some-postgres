drop table if exists persons;

create table persons (
  id serial,
  first_name varchar(50),
  last_name varchar(50),
  dob date,
  email varchar(255),
  primary key (id)
);

