drop table if exists assets;

create table assets (
  id serial primary key,
  name text not null,
  asset_no varchar not null,
  description text,
  location text,
  acquired_date date not null
);

insert into assets (name, asset_no, location, acquired_date)
values 
  ('Server','10001','Server room','2017-01-01'),
  ('UPS','10002','Server room','2017-01-01');

