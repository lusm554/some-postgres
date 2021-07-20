-- remove table test
DROP TABLE test;

-- create empty table
CREATE TABLE test (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT DEFAULT 'Moscow'
);
