drop table if exists sales;
create table sales(
  brand varchar not null,
  segment varchar not null,
  quantity int not null,
  primary key (brand, segment)
);

insert into sales(brand, segment, quantity)
values
    ('ABC', 'Premium', 100),
    ('ABC', 'Basic', 200),
    ('XYZ', 'Premium', 100),
    ('XYZ', 'Basic', 300);
