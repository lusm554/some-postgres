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
