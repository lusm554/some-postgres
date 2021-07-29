/*
create or replace function test() returns text as $$
begin
  return 'Hello';
end; $$
language plpgsql;

select test();
*/

do $$ 
declare
  test int := 1;
begin
  -- display a message
  raise notice 'Hello, world! test = %', test;
end $$;

/* 
Summary
 - PL/pgSQL is a blocked-structure language. It organize a program into blocks.
 - A block contains two parts: declaration and body. The declaration part is optional while the body part is mandatory.
- Blocks can be nested. A nested block is a block placed inside the body of another block.
 */
