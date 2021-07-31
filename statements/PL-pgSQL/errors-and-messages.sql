-- Reporting messages
do $$
begin
  raise debug 'Hello';
  raise log 'Hello';
  raise notice 'Hello';
  raise info 'Hello';
  raise warning 'Hello';
  raise exception 'Hello';
  /* this will not shown becasue exception returns error and stop curr transaction */
  raise notice 'why';
end $$;

-- Raising errors
do $$
declare
  check_city varchar(255) = 'Moscow';
begin
  if check_city in (select city from test) then
    raise 'Duplicate city %', check_city
      using hint = 'check another city';
  end if;
end $$;
