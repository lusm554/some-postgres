drop table if exists departments;
drop table if exists employees;

create table departments (
  department_id serial primary key,
  department_name varchar (255) not null
);

create table employees (
  employee_id serial primary key,
  employee_name varchar (255),
  department_id int
);

insert into departments(department_name)
values
  ('Sales'),
  ('Marketing'),
  ('HR'),
  ('IT'),
  ('Production');

insert into employees (
  employee_name,
  department_id
)
values
  ('Bette Nicholson', 1),
  ('Christian Gable', 1),
  ('Joe Swank', 2),
  ('Fred Costner', 3),
  ('Sandra Kilmer', 4),
  ('Julia Mcqueen', NULL);
