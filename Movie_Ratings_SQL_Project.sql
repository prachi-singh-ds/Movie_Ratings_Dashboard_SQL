CREATE TABLE MovieRatings (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    ReleaseYear INT,
    Rating FLOAT,
    Director VARCHAR(100),
    DurationMinutes INT,
    Language VARCHAR(50),
    Platform VARCHAR(50)
);


INSERT INTO MovieRatings VALUES
(1, 'Inception',          'Sci-Fi',      2010,    8.8,    'Christopher Nolan',    148,    'English',    'Netflix'),
(2, 'Interstellar',       'Sci-Fi',      2014,    8.6,    'Christopher Nolan',    169,    'English',    'Amazon Prime'),
(3, '3 Idiots',           'Drama',       2009,    8.4,    'Rajkumar Hirani',      170,    'Hindi',      'Netflix'),
(4, 'The Dark Knight',    'Action',      2008,    9.0,    'Christopher Nolan',    152,    'English',    'HBO Max'),
(5, 'Dangal',             'Biography',   2016,    8.3,    'Nitesh Tiwari',        161,    'Hindi',      'Disney+ Hotstar'),
(6, 'Parasite',           'Thriller',    2019,    8.6,    'Bong Joon-ho',         132,    'Korean',     'Amazon Prime'),
(7, 'Avengers: Endgame',   'Action',     2019,    8.4,    'Anthony Russo',        181,    'English',     'Disney+'),
(8, 'Joker',              'Drama',       2019,    8.4,    'Todd Phillips',        122,    'English',     'Netflix'),
(9, 'The Godfather',      'Crime',       1972,    9.2,    'Francis Ford Coppola', 175,    'English',    'Amazon Prime'),
(10, 'PK',               'Comedy',       2014,    8.1,    'Rajkumar Hirani',      153,     'Hindi',     'Netflix'),
(11, 'The Shawshank Redemption', 'Drama', 1994,   9.3,    'Frank Darabont',       142,     'English',    'HBO Max'),
(12, 'Drishyam',          'Thriller',    2015,    8.2,    'Nishikant Kamat',      163,     'Hindi',     'Amazon Prime'),
(13, 'Black Panther',     'Action',      2018,    7.3,    'Ryan Coogler',         134,     'English',    'Disney+'),
(14, 'Zindagi Na Milegi Dobara', 'Drama', 2011,   8.2,    'Zoya Akhtar',          155,     'Hindi',      'Netflix'),
(15, 'Bahubali',          'Action',       2015,   8.0,     'S. S. Rajamouli',     159,     'Telugu',      'Disney+'),
(16, 'Shershaah',         'Biography',    2021,   8.4,    'Vishnuvardhan',        135,     'Hindi',     'Amazon Prime'),
(17, 'Lagaan',            'Drama',        2001,   8.1,    'Ashutosh Gowariker',   224,     'Hindi',      'Netflix'),
(18, 'RRR',               'Action',       2022,   8.0,    'S. S. Rajamouli',      182,     'Telugu',      'Netflix'),
(19, 'Gully Boy',         'Musical',      2019,   7.9,    'Zoya Akhtar',          154,     'Hindi',       'Amazon Prime'),
(20, 'Titanic',           'Romance',      1997,   7.8,    'James Cameron',        195,     'English',     'Disney+');

                
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


SELECT * FROM MovieRatings WHERE ReleaseYear > 2020;

                        -- Extra Queries--


-- 1. Pie chart data: Genre-wise movie count
SELECT Genre, COUNT(*) AS Total FROM MovieRatings GROUP BY Genre;


-- 2. Bar chart: Release year vs number of movies
SELECT ReleaseYear, COUNT(*) AS Total FROM MovieRatings GROUP BY ReleaseYear ORDER BY ReleaseYear;


-- 3. Line chart: Year-wise average rating
SELECT ReleaseYear, AVG(Rating) AS AvgRating FROM MovieRatings GROUP BY ReleaseYear ORDER BY ReleaseYear;


-- 4. Top 5 highest rated movies
SELECT TOP 5 Title, Rating FROM MovieRatings ORDER BY Rating DESC;


-- 5. Bottom 5 lowest rated movies
SELECT TOP 5 Title, Rating FROM MovieRatings ORDER BY Rating ASC;