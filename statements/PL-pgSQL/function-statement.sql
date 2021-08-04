create or replace function smth()
  returns int
  language plpgsql
  as
$$
begin
  return 1;
end $$;

create or replace function get_count(which_city text)
  returns int
  language plpgsql
  as
$$
declare
  count int;
begin
  select count(*)
  from test
  into count
  where city = which_city;
  return count;
end $$;

select get_count(
  which_city => 'Moscow'
);
-- Function Parameter Modes: IN, OUT, INOUT

-- The IN mode
create or replace function inmode(num int)
  returns varchar
  language plpgsql
  as
$$
declare
  str text = '';
begin
  for i in 1..num loop
    str = str || 'hello '; 
  end loop;
  return str;
end $$;

select * from inmode(5);

-- The OUT mode
create or replace function get_city_stat(
  out max_len int,
  out min_len int,
  out avg_len numeric
)
  language plpgsql
  as
$$
begin
  select min(char_length(city)),
         max(char_length(city)),
         avg(char_length(city))::numeric(5, 1)
  from test
  into max_len, min_len, avg_len;
end $$;

select * from get_city_stat();

-- The INOUT mode
create or replace function inoutmode(
  inout x int,
  inout y int
)
  language plpgsql
as $$
begin
  select x, y into y, x;  
end $$;

do $$
declare
  x int = 1;
  y int = 2;
begin
  raise notice 'before x = %, y = %', x, y;
  select * from inoutmode(1, 2)
  into x, y;
  raise notice 'after x = %, y = %', x, y;
end $$;




















