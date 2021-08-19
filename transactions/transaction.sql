-- insert a new row into the accounts table immediately. In this case, you do not know when the transaction begins and cannot intercept the modification such as rolling it back.
insert into accounts(name, balance)
values ('Bob', 10000);

-- start transaction
begin; -- or begin work or begin transaction

insert into accounts(name, balance)
values ('Alice', 10000);

-- To make the change become visible to other sessions (or users) you need to commit the transaction by using the COMMIT WORK statement:
commit; -- or commit work or commit transaction

begin;

update accounts
set balance = balance - 1000
where id = 1;

update accounts
set balance = balance + 1000
where id = 2;

select id, name, balance
from accounts;

commit;

insert into accounts (name, balance)
values ('Jack', 0);

begin;

update accounts
set balance = balance - 1500
where id = 1;

update accounts
set balance = balance + 1500
where id = 3;

rollback; -- or rollback work or rollback transaction

select *
from
  accounts;

