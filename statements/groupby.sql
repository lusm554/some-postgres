/*insert into test(name, city)
values ('smth', 'sf');*/

select count(*), city from test
group by city
order by count(*) asc;
