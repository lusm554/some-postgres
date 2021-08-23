-- Constraints
/*
PostgreSQL includes the following column constraints:
  • NOT NULL - ensures that values in a column cannot be NULL.

  • UNIQUE - ensures the values in a column unique across the rows within the same table.

  • PRIMARY KEY - a primary key column uniquely identify rows in a table. A table can have one and only one primary key. The primary key constraint allows you to define the primary key of a table.
  
  • CHECK - a CHECK constraint ensures the data must satisfy a boolean expression.

  • FOREIGN KEY - ensures values in a column or a group of columns from a table exists in a column or group of columns in another table. Unlike the primary key, a table can have many foreign keys.

Table constraints are similar to column constraints except that they are applied to more than one column.
*/

create table if not exists accounts (
  user_id serial primary key,
  username varchar(50) unique not null,
  password varchar(50) not null,
  email varchar(255) unique not null,
  created_on timestamp not null,
  last_login timestamp
);

create table if not exists roles (
  role_id serial primary key,
  role_name varchar(255) unique not null
);

create table if not exists account_roles (
  user_id int not null,
  role_id int not null,
  grant_date timestamp,
  primary key (user_id, role_id),
  foreign key (role_id)
    references roles (role_id),
  foreign key (user_id)
    references accounts (user_id)
);

-- Summary
/*
  • Use the CREATE TABLE statement to create a new table.
  • Use the IF NOT EXISTS option to create the new table only if it does not exist.
  • Apply the primary key, foreign key, not null, unique, and check constraints to columns of a table.  
*/

