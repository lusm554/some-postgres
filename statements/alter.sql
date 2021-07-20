ALTER TABLE test
ADD COLUMN second_name TEXT;

INSERT INTO test
(id, name, second_name)
VALUES (6, 'Nikita', 'second name here');

SELECT * FROM test;
