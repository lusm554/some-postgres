select min(id) as min_id, 
       max(id) as max_id from test;

select max(id) as max_even_id, min(id) as min_even_id from test
where id % 2 = 0;
