-- if-then statement
do $$
begin
 if 1 < 2 then
    raise notice '1 < 2 == true';
  end if;

  if 0 = 1 then
    raise notice '0 == 1';
  end if;
end $$;

-- if-then-else statement
do $$
declare
  test bool = false;
begin
  if test then
    raise notice 'test is true';
  else
    raise notice 'test is false';
  end if;
end $$;


-- if-then-elsif statement
do $$
declare
  somevar    bool = false;
  anothervar bool = false;
  onemorevar bool = true;
begin
  if somevar then
    raise notice 'somevar true';
  elsif anothervar then
    raise notice 'anothervar true';
  elsif onemorevar then
    raise notice 'onemorevar true';
  else
    raise notice 'true vars not found';
  end if;
end $$;
  
