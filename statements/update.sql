-- before
SELECT * FROM test;

UPDATE test
SET name = 'nikita -> Nikita'
WHERE id == 1;

-- after
SELECT * FROM test;

