create table basket_a (
  a int primary key,
  fruit_a varchar (100) not null
);

create table basket_b (
  b int primary key,
  fruit_b varchar (100) not null
);

insert into basket_a (a, fruit_a)
values 
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');

insert into basket_b (b, fruit_b)
values
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');

