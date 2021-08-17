-- INSERT

-- Inserting a single row into a table
insert into links (url, name)
values ('http://github.com/lusm554', 'github')
returning *; -- get inserted row

-- Inserting character string that contains a single quote
insert into links (url, name)
values ('https://smth.com', 'I''m Nikita');

-- Inserting a date value
insert into links (url, name, last_update)
values ('2021.com', 'Year', '2021-08-16');

-- INSERT Multiple Rows

-- Inserting multiple rows
insert into links (
  url,
  name
)
values
    ('https://www.google.com','Google'),
    ('https://www.yahoo.com','Yahoo'),
    ('https://www.bing.com','Bing');

-- Inserting multiple rows and returning inserted rows
insert into links (
  url,
  name,
  description
)
values
    ('https://duckduckgo.com/','DuckDuckGo','Privacy & Simplified Search Engine'),
    ('https://swisscows.com/','Swisscows','Privacy safe WEB-search')
returning *;

-- UPDATE

-- updating one row
update courses
set published_date = '2020-08-01' 
where course_id = 3
returning *;

-- UPDATE Join

update 
  product p
set 
  net_price = price - price * discount
from
  product_segment s
where
  p.segment_id = s.id
returning *;

-- DELETE

-- delete one row from the table
delete from links
where id = 1
returning *;

-- delete multiple rows from the table
delete from links
where id in (6, 3)
returning *;

-- delete all rows from the table
delete from links;

-- Upsert

insert into customers (name, email)
values ('Microsoft','hotline@microsoft.com') 
on conflict on constraint customers_name_key
do nothing;

-- same

insert into customers (name, email)
values ('Microsoft','hotline@microsoft.com')
on conflict (name)
do nothing;

insert into customers (name, email)
values ('Microsoft','hotline@microsoft.com') 
on conflict (name)
do
  update set email = EXCLUDED.email || ';' || customers.email
returning *;

