-- outputs even numbers
do $$
declare
  count int = 0;
begin
 <<counter>>
  loop
    if count > 10 then
      exit counter;
    end if;
    if count % 2 = 0 and count != 0 then
      raise notice '%', count;
    end if;
    count = count + 1;
  end loop;
end $$;

-- fib numbers
do $$
declare
  f bigint = 0;
  s bigint = 1;
  count int = 1;
begin
  loop
    exit when count = 90;
    count = count + 1; 
    raise notice 'number % - %', count, f;
    select s, (f + s) into f, s;
  end loop;
end $$;
