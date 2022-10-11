-- 1. How many actors are there with the last name ‘Wahlberg’?
-- 2 actors with the last name Wahlberg

SELECT last_name, COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg'
GROUP BY last_name;

-- 2. How many payments were made between $3.99 and $5.99?
--  3,273 payments between 3.99 and 5.99

SELECT COUNT(*)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)
-- Curtain Videotape

SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(*)DESC;

SELECT title
FROM film
WHERE film_id = 200;

-- 4. How many customers have the last name ‘William’?
-- There are no customers with the last name William, but there is a 'Williams'

SELECT last_name, COUNT(last_name)
FROM customer
WHERE last_name = 'William'
GROUP BY last_name;

SELECT last_name
FROM customer
WHERE last_name ='Williams'

-- 5. What store employee (get the id) sold the most rentals?
-- Employee 1 - Mike Hillyer has the most rentals

SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id;

SELECT last_name, first_name
FROM staff
WHERE staff_id = 1;

-- 6. How many different district names are there?
-- There are 378 districts

SELECT COUNT(DISTINCT district)
FROM address

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- Lambs Cincinatti has the most actors starring in it with 16 total

SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

SELECT film_id, title
FROM film
WHERE film_id = 508;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT COUNT(*)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
-- 9 payment amounts greater than 250
SELECT amount, COUNT(*) AS a_number
FROM payment
GROUP BY amount
HAVING COUNT(*)>250
ORDER BY COUNT(*) DESC;

SELECT inventory_id, COUNT(*)
FROM inventory
WHERE inventory_id BETWEEN 380 AND 430
GROUP BY inventory_id
-- LIMIT 5

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
-- PG-13 has the most movies in stock. There are 5 different ratings

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(*)DESC;

SELECT COUNT(DISTINCT rating) AS total_rating_categories
FROM film;

SELECT rating, COUNT(*)
FROM film
WHERE rating = 'PG-13'
GROUP BY rating;