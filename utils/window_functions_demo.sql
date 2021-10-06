create table if not exists product_groups (
  group_id serial primary key,
  group_name varchar not null
);

create table if not exists products (
  product_id serial primary key,
  product_name varchar not null,
  price decimal (11, 2),
  group_id int not null,
  FOREIGN KEY (group_id) REFERENCES product_groups (group_id)
);

insert into product_groups(group_name)
values
  ('Smartphone'),
  ('Laptop'),
  ('Tablet');

insert into products (product_name, group_id,price)
values
  ('Microsoft Lumia', 1, 200),
  ('HTC One', 1, 400),
  ('Nexus', 1, 500),
  ('iPhone', 1, 900),
  ('HP Elite', 2, 1200),
  ('Lenovo Thinkpad', 2, 700),
  ('Sony VAIO', 2, 700),
  ('Dell Vostro', 2, 800),
  ('iPad', 3, 700),
  ('Kindle Fire', 3, 150),
  ('Samsung Galaxy Tab', 3, 200);

