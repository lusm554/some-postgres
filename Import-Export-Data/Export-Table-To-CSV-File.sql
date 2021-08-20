-- copy all columns
copy persons to 'path_to_file/persons_db.csv' delimiter ',' csv header;

-- copy some columns
copy persons(first_name, last_name)
to 'path_to_file/persons_db.csv' delimiter ',' csv header;

-- without header
copy persons(email)
to 'path_to_file/persons_db.csv' delimiter ',' csv;

