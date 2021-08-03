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
