-- Select all columns needed to compute the average rating per movie

SELECT movie_id,  
       rating
FROM renting;

-- from beginning April 2018 to end August 2018

SELECT *
FROM renting
WHERE date_renting BETWEEN '2018-04-01' AND '2018-08-31' ORDER BY date_renting DESC;

-- All genres except drama
SELECT *
FROM movies
WHERE genre <> 'Drama'; 

-- Select all movies with the given titles

SELECT *
FROM movies
WHERE movie_id IN (
    SELECT movie_id
    FROM movies
    WHERE title IN ('Showtime', 'Love Actually', 'The Fighter')
);

-- Order the movies by increasing renting price
SELECT *
FROM movies
ORDER BY renting_price; 

--Select from table renting all movie rentals from 2018.
SELECT *
FROM renting
WHERE date_renting  BETWEEN '2018-01-01' AND '2018-12-31' -- Renting in 2018
AND rating IS NOT NULL; -- Rating exists

SELECT Count(customer_id) -- Count the total number of customers
FROM customers
WHERE date_of_birth BETWEEN '1980-01-01' AND '1989-12-31'; -- Select customers born between 1980-01-01 and 1989-12-31

SELECT COUNT (customer_id)  -- Count the total number of customers
FROM customers
WHERE country = 'Germany'; -- Select all customers from Germany

SELECT Count (Distinct country)   -- Count the number of countries
FROM customers;

SELECT MIN (rating) as min_rating, -- Calculate the minimum rating and use alias min_rating
	   MAX(rating) as max_rating, -- Calculate the maximum rating and use alias max_rating
	  avg (rating) as avg_rating, -- Calculate the average rating and use alias avg_rating
	  Count (rating) as number_ratings -- Count the number of ratings and use alias number_ratings
FROM renting
WHERE movie_id  = 25; -- Select all records of the movie with ID 25

SELECT * -- Select all records of movie rentals since January 1st 2019
FROM  RENTING 
WHERE date_renting  >= '2019-01-01'; 

SELECT 
	COUNT(renting_id), -- Count the total number of rented movies
	avg(rating) -- Add the average rating
FROM renting
WHERE date_renting >= '2019-01-01';

SELECT 
	COUNT(*) as number_renting, -- Give it the column name number_renting
	AVG(rating) as average_rating  -- Give it the column name average_rating
FROM renting
WHERE date_renting >= '2019-01-01';

SELECT 
	COUNT(*) AS number_renting,
	AVG(rating) AS average_rating, 
    count (rating) AS number_ratings -- Add the total number of ratings here.
FROM renting
WHERE date_renting >= '2019-01-01';










