-- Basic Queries--

-- 1. Show all movie records
SELECT * FROM MovieRatings;

-- 2. Show only movie titles and their ratings
SELECT Title, Rating FROM MovieRatings;

-- 3. List all movies in the "Action" genre
SELECT * FROM MovieRatings WHERE Genre = 'Action';

-- 4. List all movies released after 2015
SELECT * FROM MovieRatings WHERE ReleaseYear > 2015;

-- 5. List all movies with rating >= 8
SELECT * FROM MovieRatings WHERE Rating >= 8;

-- 6. Order movies by rating in descending order
SELECT * FROM MovieRatings ORDER BY Rating DESC;

-- 7. Order movies by ReleaseYear ascending
SELECT * FROM MovieRatings ORDER BY ReleaseYear ASC;

-- 8. Count total number of movies
SELECT COUNT(*) AS TotalMovies FROM MovieRatings;

-- 9. Count how many Action movies are there
SELECT COUNT(*) AS ActionMovies FROM MovieRatings WHERE Genre = 'Action';

-- 10. Show movies with "Love" in title
SELECT * FROM MovieRatings WHERE Title LIKE '%Love%';

-- 11. Show movies starting with letter 'T'
SELECT * FROM MovieRatings WHERE Title LIKE 'T%';

-- 12. Show only unique genres
SELECT DISTINCT Genre FROM MovieRatings;

-- 13. List movies released between 2010 and 2020
SELECT * FROM MovieRatings WHERE ReleaseYear BETWEEN 2010 AND 2020;

-- 14. Show movies where Rating is NULL (if any)
SELECT * FROM MovieRatings WHERE Rating IS NULL;

-- 15. Show movies where Rating is NOT NULL
SELECT * FROM MovieRatings WHERE Rating IS NOT NULL;

                