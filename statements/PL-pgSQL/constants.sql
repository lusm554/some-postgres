do $$
declare
  test_const constant text = 'hello';
  vat constant        int = 0.1;
begin
  raise notice '%', test_const;
end; $$
