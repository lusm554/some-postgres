do $$
begin
  for i in 2..10 loop
    if i % 2 != 0 then
      continue;
    end if;
    raise notice '%', i;
  end loop;
end $$;
