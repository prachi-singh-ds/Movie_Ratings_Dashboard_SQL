  -- Advanced Queries--

-- 1. Average rating of all movies
SELECT AVG(Rating) AS AverageRating FROM MovieRatings;

-- 2. Maximum rating and corresponding movie
SELECT TOP 1 * FROM MovieRatings ORDER BY Rating DESC;

-- 3. Minimum rating and corresponding movie
SELECT TOP 1 * FROM MovieRatings ORDER BY Rating ASC;

-- 4. Number of movies by genre
SELECT Genre, COUNT(*) AS MovieCount FROM MovieRatings GROUP BY Genre;

-- 5. Average rating by genre
SELECT Genre, AVG(Rating) AS AvgRating FROM MovieRatings GROUP BY Genre;

-- 6. Latest movie released in each genre
SELECT Genre, MAX(ReleaseYear) AS LatestYear
FROM MovieRatings GROUP BY Genre;

-- 7. Highest rated movie in each genre
SELECT Genre, Title, Rating
FROM MovieRatings M1
WHERE Rating = (
    SELECT MAX(Rating)
    FROM MovieRatings M2
    WHERE M1.Genre = M2.Genre
);

-- 8. List of genres sorted by avg rating descending
SELECT Genre, AVG(Rating) AS AvgRating
FROM MovieRatings
GROUP BY Genre
ORDER BY AvgRating DESC;

-- 9. Movies with same rating as another movie
SELECT * FROM MovieRatings
WHERE Rating IN (
    SELECT Rating FROM MovieRatings
    GROUP BY Rating
    HAVING COUNT(*) > 1
);

-- 10. Second highest rated movie
SELECT * FROM MovieRatings
WHERE Rating = (
    SELECT MAX(Rating) FROM MovieRatings
    WHERE Rating < (
        SELECT MAX(Rating) FROM MovieRatings
    )
);

-- 11. Movies released after 2020
SELECT * FROM MovieRatings WHERE ReleaseYear > 2020;
