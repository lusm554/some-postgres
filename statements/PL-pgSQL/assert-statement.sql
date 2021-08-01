/*
  - Use the assert statement to add debugging checks to the PL/pgSQL code.
  - The assert statement evaluates a condition that is expected to be true and issues an error in case the condition is false or null.
  - Use the assert statement for detecting bugs only. For reporting ordinary messages and errors, use the raise statement instead.
*/

do $$
declare
  test bool = false;
begin
  assert test, 'wtf';
end $$;
