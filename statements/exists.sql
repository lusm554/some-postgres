/*select * from test;
select * from metadata;*/

select * from test
where exists (select id from metadata where test.id = metadata.id);
