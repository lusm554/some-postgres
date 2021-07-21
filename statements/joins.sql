/*
insert into test (name)
values ('guest1');

insert into test(name)
values ('guest2'); 

insert into metadata (name, age, address, phone)
values ('anothergues1', 17, 'where', 'numbers');

insert into metadata (name, age, address, phone)
values ('anothergues2', 18, 'where', 'numbers');
*/

/* get records that have matching values in both tables */
select m.* from test t
inner join metadata m on t.id = m.id and t.name = m.name; -- inner join == join

/* get all records from the left table(t), and the matching records from the right talbe(t) */
select m.* from test t
left join metadata m on t.id = m.id and t.name = m.name;

/* get all records from the right table(m), and the matching records from the left table (t) */
select m.* from test t
right join metadata m on t.id = m.id and t.name = m.name;

/* get all records when there is a match in left or right table records.  */
select t.id as test_id, m.* from test t
full join metadata m on t.id = m.id and t.name = m.name;

/* sefl join is a reguler join, but the table is joined with itself */
select t.id from test t, metadata m
where t.id != m.id
order by t.id;
