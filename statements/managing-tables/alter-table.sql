/*To change the structure of an existing table, you use PostgreSQL ALTER TABLE statement.*/

-- add new column
alter table links
add column active bool;

-- remove column
alter table links
drop column active;

-- change name of the column
alter table links
rename column title to link_title;

-- add new column
alter table links
add column target varchar(10);

-- To set _blank as the default value for the target column in the links table, you use the following statement
alter table links
alter column target
set default '_blank';

insert into links (link_title, url)
values ('PostgreSQL Tutorial','https://www.postgresqltutorial.com/');

select * from links;

-- The following statement adds a CHECKcondition to the targetcolumn so that the targetcolumn only accepts the following values: _self, _blank, _parent, and _top:
alter table links
add check (target in ('_self', '_blank', '_parent', '_top'));

insert into links (link_title, url, target)
values ('PostgreSQL','http://www.postgresql.org/', 'smth'); -- throw error

-- The following statement adds a UNIQUE constraint to the url column of the links table:
alter table links
add constraint unique_url unique ( url );

insert into links(link_title, url)
values ('PostgreSQL','https://www.postgresqltutorial.com/'); -- throw error

-- The following statement changes the name of the links table to urls:
alter table links
rename to urls;

select * from urls;

