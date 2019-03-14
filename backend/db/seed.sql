DROP DATABASE IF EXISTS reviewworld;
CREATE DATABASE reviewworld;

\c reviewworld;

DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS comments;

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL
);

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR NOT NULL,
  genre_id INT REFERENCES genres(id),
  image VARCHAR NOT NULL
);

CREATE TABLE ratings (
  id SERIAL PRIMARY KEY,
  movie_id INT REFERENCES movies(id),
  stars INT NOT NULL
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  comment VARCHAR NOT NULL,
  movie_id INT REFERENCES movies(id)
);

INSERT INTO genres(name)
VALUES ('Adventure'),('Comedy'),('Family'),('Action'),('Sci-Fi');

INSERT INTO movies(title, genre_id, image)
VALUES ('The Goonies', 1, 'https://m.media-amazon.com/images/M/MV5BNGViMjJjNTUtY2IzNi00YzcyLWFjODUtMjc0NTI3YWNhNjgzXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SY1000_CR0,0,662,1000_AL_.jpg'),('Rush Hour', 2, 'https://m.media-amazon.com/images/M/MV5BYWM2NDZmYmYtNzlmZC00M2MyLWJmOGUtMjhiYmQ2OGU1YTE1L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SY1000_CR0,0,678,1000_AL_.jpg'), ('The Dark Knight', 4, 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SY1000_CR0,0,675,1000_AL_.jpg'), ('Avengers: Infinity War', 1, 'https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_SY1000_CR0,0,674,1000_AL_.jpg'), ('Back To The Future', 5, 'https://m.media-amazon.com/images/M/MV5BZmU0M2Y1OGUtZjIxNi00ZjBkLTg1MjgtOWIyNThiZWIwYjRiXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SY1000_CR0,0,643,1000_AL_.jpg'), ('Wall-E', 3, 'https://m.media-amazon.com/images/M/MV5BMjExMTg5OTU0NF5BMl5BanBnXkFtZTcwMjMxMzMzMw@@._V1_SY1000_CR0,0,674,1000_AL_.jpg'), ('Logan', 4, 'https://m.media-amazon.com/images/M/MV5BYzc5MTU4N2EtYTkyMi00NjdhLTg3NWEtMTY4OTEyMzJhZTAzXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_.jpg'), ('Inception', 5, 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SY1000_CR0,0,675,1000_AL_.jpg'), ('Monty Python and The Holy Grail', 2, 'https://m.media-amazon.com/images/M/MV5BN2IyNTE4YzUtZWU0Mi00MGIwLTgyMmQtMzQ4YzQxYWNlYWE2XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,666,1000_AL_.jpg'), ('Toy Story', 3, 'https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_SY1000_SX670_AL_.jpg');

INSERT INTO ratings(movie_id , stars)
VALUES (1, 5), (5, 5), (2, 3), (8, 4), (3, 5), (1, 3), (4, 5), (10, 3), (5, 2), (2, 5), (6, 4), (9, 3), (7, 4), (3, 2), (4, 3), (8, 3), (6, 1), (9, 5), (7, 2), (10, 5);

INSERT INTO comments (comment, movie_id)
VALUES ('I LOVE THIS MOVIE!!', 1), ('This movie made me fall asleep', 5), ('My childhood is this movie', 10), ('Made me cry', 6), ('Trippy ass fuck!!', 8), ('My dad loves this movie', 9), ('Sloth is my spirit animal...', 1), ('JACKKKKYYYY!!! One more thing.', 2), ('I had a dream of this dream.', 8), ('Soooooo boring', 9), ('I WANT A MCLAREN', 5), ('The Joker was the star!', 3), ('Its creepy to think that your toys would do this in real life', 10), ('OH SNAPPP', 4), ('LOGAAAAANNNNNN!!!', 7);
