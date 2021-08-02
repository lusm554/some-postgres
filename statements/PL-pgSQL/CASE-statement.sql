-- Simple case statement
do $$
declare
  smth int = 9;
begin
  case smth
    when 1 then
      raise notice 'smth = 1';
    when 5 then
      raise notice 'smth = 5';
    when 9 then
      raise notice 'smth = 9';
    else
      raise notice 'smth not 1, 5, 9';
    end case;
end $$;

-- Searched case statement
do $$
declare
  num int = 3;
begin
  case
    when num > 100 then
      raise notice 'num > 100';
    when num < 10 then
      raise notice '% < 10', num;
    end case;
end $$;
