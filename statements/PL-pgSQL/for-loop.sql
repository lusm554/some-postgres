-- loop to iterate over a range of integers
do $$
begin
  for i in 1..5 loop
    raise notice '%', i;
  end loop;
end $$;

do $$
begin
  for i in reverse 10..1 loop
    raise notice '%', i;
  end loop;
end $$;

do $$
begin
  for i in 2..10 by 2 loop
    raise notice '%', i;
  end loop;
end $$;

-- loop to iterate over a result set
do $$
declare
  from_test record;
begin 
  for from_test in select name, city
    from test
    limit 3
  loop
    raise notice '% from %', from_test.name, from_test.city;
  end loop;
end $$;
