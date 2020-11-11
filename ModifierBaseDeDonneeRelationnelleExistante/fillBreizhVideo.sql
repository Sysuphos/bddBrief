INSERT INTO breizhvideo.actor
SELECT * FROM sakila.actor;

INSERT INTO breizhvideo.category
SELECT * FROM sakila.category;

INSERT INTO breizhvideo.film (title, description, release_year,length,special_features,last_update)
SELECT title, description, release_year,length,special_features,last_update
FROM sakila.film;

INSERT INTO breizhvideo.film_actor
SELECT * FROM sakila.film_actor;

INSERT INTO breizhvideo.film_category
SELECT * FROM sakila.film_category;