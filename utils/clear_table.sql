-- remove table test
DROP TABLE test;

-- create empty table
CREATE TABLE test (
  id serial primary key, -- in postgres 'auto_increment' does not exist
  name TEXT NOT NULL,
  city TEXT DEFAULT 'Moscow'
);
