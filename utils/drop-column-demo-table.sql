drop table if exists publishers;
drop table if exists categories;
drop table if exists books;

create table publishers (
  publisher_id serial primary key,
  name varchar not null
);

create table categories (
  category_id serial primary key,
  name varchar not null
);

create table books (
  book_id serial primary key,
  title varchar not null,
  isbn varchar not null,
  published_date varchar,
  description varchar,
  category_id int not null,
  publisher_id int not null,
  foreign key (publisher_id)
    references publishers (publisher_id),
  foreign key (category_id)
    references categories (category_id)
);

