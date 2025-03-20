CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255),
    release_year INT,
    runtime INT,
    genre VARCHAR(255)
);



SET SQL_SAFE_UPDATES = 0;

DELETE FROM movies 
WHERE title IS NULL OR release_year IS NULL OR runtime IS NULL OR genre IS NULL;

SET SQL_SAFE_UPDATES = 1;



CREATE TABLE cleaned_movies AS 
SELECT 
    movie_id,
    title, 
    release_year, 
    runtime, 
    GROUP_CONCAT(DISTINCT genre ORDER BY genre ASC SEPARATOR ', ') AS genres
FROM movies
GROUP BY movie_id, title, release_year, runtime;
