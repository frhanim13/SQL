

SELECT m.renting_price, -- Use a join to get the movie title and price for each movie rental
       m.title
FROM renting AS r
LEFT JOIN movies AS m
ON r.movie_id=m.movie_id;

SELECT rm.title, -- Report the income from movie rentals for each movie 
       SUM(rm.renting_price) AS income_movie
FROM
       (SELECT m.title, 
               m.renting_price
       FROM renting AS r
       LEFT JOIN movies AS m
       ON r.movie_id=m.movie_id) AS rm
GROUP BY rm.title
ORDER BY income_movie DESC; -- Order the result by decreasing income

SELECT a.gender, -- Report for male and female actors from the USA 
       max(a.year_of_birth), -- The year of birth of the oldest actor
       min(a.year_of_birth)-- The year of birth of the youngest actor
FROM
   (SELECT * -- Use a subsequen SELECT to get all information about actors from the USA
  FROM actors
   WHERE nationality ='USA' ) as a-- Give the table the name a
GROUP BY a.gender;

SELECT *
FROM renting AS r
LEFT JOIN customers as c   -- Add customer information
on r.customer_id = c.customer_id
LEFT JOIN movies as m    -- Add movie information
on r.movie_id=m.movie_id;



SELECT *
FROM renting AS r
LEFT JOIN customers AS c
ON c.customer_id = r.customer_id
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE c.date_of_birth BETWEEN '1970-01-01' AND '1979-12-31'; -- Select customers born in the 70s



SELECT m.title, 
COUNT(*), -- Report number of views per movie
AVG(r.rating) -- Add the average rating for each movie
FROM renting AS r
LEFT JOIN customers AS c
ON c.customer_id = r.customer_id
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE c.date_of_birth BETWEEN '1970-01-01' AND '1979-12-31'
GROUP BY m.title;

SELECT m.title, 
COUNT(*),
AVG(r.rating)
FROM renting AS r
LEFT JOIN customers AS c
ON c.customer_id = r.customer_id
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE c.date_of_birth BETWEEN '1970-01-01' AND '1979-12-31'
GROUP BY m.title
HAVING COUNT(*) > 1-- Remove movies with only one rental
ORDER BY AVG(r.rating) DESC; -- Order with highest rating first





