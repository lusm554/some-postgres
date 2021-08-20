copy persons(first_name, last_name, dob, email)
from 'path_to_file/persons.csv'
delimiter ','
csv header;

select * from persons;

