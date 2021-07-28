create or replace function add_one(i integer) returns integer as $$
begin
  return i + 1;
end;
$$ language plpgsql;

create or replace function factorial(n integer) returns integer as $$
begin
  if n <= 1 then
    return 1;
  end if;
  return n * factorial(n-1);
end;
$$ language plpgsql;


select factorial(5) as fac;

/* 
 def fac(n):
    if n <= 1:  
        return 1
    return n * fac(n-1)

print(fac(5))
 */
