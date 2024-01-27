SELECT country, -- For each country report the earliest date when an account was created
	MIN(date_account_start) AS first_account
FROM customers
GROUP BY country
ORDER BY first_account;


SELECT movie_id, 
       avg (rating) -- Calculate average rating per movie
FROM renting
GROUP BY movie_id;

SELECT movie_id, 
       AVG(rating) AS avg_rating, -- Use as alias avg_rating
       count(rating) as number_rating,                -- Add column for number of ratings with alias number_rating
       count(movie_id) as number_renting                -- Add column for number of movie rentals with alias number_renting
FROM renting
GROUP BY movie_id;
ORDER BY avg_rating DESC; -- Order by average rating in decreasing order

SELECT customer_id, -- Report the customer_id
      avg(rating) ,  -- Report the average rating per customer
      count(rating),  -- Report the number of ratings per customer
     count(movie_id)  -- Report the number of movie rentals per customer
FROM renting
GROUP BY customer_id
HAVING count(movie_id) > 7-- Select only customers with more than 7 movie rentals
ORDER BY avg(rating); -- Order by the average rating in ascending order

SELECT * -- Join renting with customers
FROM renting as r
LEFT JOIN customers as c
ON r.customer_id=c.customer_id
WHERE country='Belgium'; -- Select only records from customers coming from Belgium

SELECT avg(rating) -- Average ratings of customers from Belgium
FROM renting AS r
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
WHERE c.country='Belgium';

SELECT *
FROM renting AS r
LEFT JOIN movies AS m -- Choose the correct join statment
ON r.movie_id=m.movie_id;

SELECT 
	sum(m.renting_price), -- Get the revenue from movie rentals
	count(*), -- Count the number of rentals
	count( DISTINCT r.customer_id) -- Count the number of customers
FROM renting AS r
LEFT JOIN movies AS m
ON r.movie_id = m.movie_id;


SELECT 
	SUM(m.renting_price), 
	COUNT(*), 
	COUNT(DISTINCT r.customer_id)
FROM renting AS r
LEFT JOIN movies AS m
ON r.movie_id = m.movie_id
-- Only look at movie rentals in 2018
WHERE date_renting BETWEEN '2018-01-01' AND '2018-12-31';


SELECT m.title, -- Create a list of movie titles and actor names
       a.name
FROM actsin as ai
LEFT JOIN movies AS m
ON m.movie_id = ai.movie_id
LEFT JOIN actors AS a
ON a.actor_id =ai.actor_id ;






