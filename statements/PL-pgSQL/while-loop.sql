do $$
declare
  count int = 0;
begin
  while count < 10 loop
    raise notice '%', count;
    count = count + 1;
  end loop;
end $$;
