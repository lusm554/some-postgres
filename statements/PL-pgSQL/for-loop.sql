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

-- loop to iterate over the result set of a dynamic query
do $$
declare
  rec record;
  sort_type smallint = 2;
  query text;
  rec_count int = 5;
begin
  query = 'select name, city from test ';
  if sort_type = 1 then
    query = query || 'order by id';
  elsif sort_type = 2 then
    query = query || 'order by name desc';
  end if;
  query = query || ' limit $1';

  for rec in execute query using rec_count
  loop
    raise notice '% from %', rec.name, rec.city;
  end loop;
end $$;
