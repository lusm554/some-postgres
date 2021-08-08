drop table if exists top_rated_films;
create table top_rated_films(
  title varchar not null,
  release_year smallint
);

drop table if exists most_popular_films;
create table most_popular_films(
  title varchar not null,
  release_year smallint
);

insert into
  top_rated_films(title, release_year)
values
   ('The Shawshank Redemption',1994),
   ('The Godfather',1972),
   ('12 Angry Men',1957);

insert into
  most_popular_films(title, release_year)
values
   ('An American Pickle',2020),
   ('The Godfather',1972),
   ('Greyhound',2020);
