create or replace function get_pep(pep_id int)
  returns table (pep_name text, pep_city text)
  language plpgsql
as $$
begin
  return query 
  select name, city from test
  where id = pep_id;
end $$;

--select * from get_pep(1);


create or replace function get_pep_format(pep_id int)
  returns table (pep_name text, pep_city text)
  language plpgsql
as $$
declare
  query text = 'select name, city from test where id = $1';
  var_r record;
begin
  

  for var_r in execute query using pep_id loop
    pep_name = upper(var_r.name);
    pep_city = upper(var_r.city);
    return next; -- The return next statement adds a row to the returned table of the function.
  end loop;
end $$;

--select * from get_pep_format(5)
