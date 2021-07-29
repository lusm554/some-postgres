-- Variable initialization timing
do $$
declare
  created_at time = now();
begin
  raise notice '%', created_at;
  --perform pg_sleep(10); -- sleep 10 seconds
  raise notice '%', created_at;
end $$;

do $$
declare
  test text;
begin
  raise notice '%', test;
  test='Hello, World!';
  raise notice '%', test;
end $$;

-- Copying data types
do $$
declare
  _name test.name%type;
  mycity test.city%type;
  required_id int = 2;
begin
  select name, city from test
  into _name, mycity
  where id = required_id;

  raise notice 'Required id = % where name: % city: %', required_id, _name, mycity;
end $$;

-- Variables in block and subblock
do $$
<<outer_block>>
declare
  counter int = 0;
begin
  counter = counter + 1;
  raise notice 'Curr value of counter %', counter;
  
  declare
    counter int = 0;
  begin
    counter = counter + 10;
    raise notice 'Counter in subblock is %', counter;
    raise notice 'Counter in out outer_block %', outer_block.counter;
  end;
  raise notice 'Counter in the outer block %', counter;
end outer_block $$;
