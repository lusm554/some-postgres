-- exit from loop, for, while
do $$
declare
  count int = 1;
begin
  loop
    exit when count = 10;
    count = count + 1;
    raise notice '%', count;
  end loop; 
end $$;

-- exit from block
do $$
begin
  <<small_block>>
  declare
    is_exit_right_here bool = true;
  begin
    exit small_block when is_exit_right_here = true;
    raise notice 'if you see it means is_exit_right_here=false';
  end small_block;
end $$;
