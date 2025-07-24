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