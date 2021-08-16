drop table if exists courses;

create table courses (
  course_id serial primary key,
  course_name varchar(255) not null,
  description varchar(500),
  published_date date
);

insert into courses (
  course_name,
  description,
  published_date
)

values
  ('PostgreSQL for Developers','A complete PostgreSQL for Developers','2020-07-13'),
  ('PostgreSQL Admininstration','A PostgreSQL Guide for DBA',NULL),
  ('PostgreSQL High Performance',NULL,NULL),
  ('PostgreSQL Bootcamp','Learn PostgreSQL via Bootcamp','2013-07-11'),
  ('Mastering PostgreSQL','Mastering PostgreSQL in 21 Days','2012-06-30');

