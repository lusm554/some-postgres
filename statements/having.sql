select count(city), city from test
group by city 
having count(city) > 2;

/* having clause was added to sql bc the where keyword cannot be used with aggregate functions */
