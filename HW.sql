-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';

--ANSWER There are 2 Wahlbergs

-- 2. How many payments were made between $3.99 and $5.99?

SELECT  COUNT(*)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--Answer is 0

-- 3. What film does the store have the most of? (search in inventory)

SELECT film_id, COUNT(film_id) AS copy_count
FROM inventory
GROUP BY film_id 
ORDER BY copy_count DESC
LIMIT 1;
--film id 350 copy count is 8

-- 4. How many customers have the last name ‘William’?

SELECT last_name
FROM customer
WHERE last_name = 'William';

-- 0 customer with last name William'

-- 5. What store employee (get the id) sold the most rentals?

SELECT staff_id, COUNT(*) AS rental_count
FROM rental
GROUP BY staff_id
ORDER BY rental_count DESC
LIMIT 1;
-- staff_id 1 sold the most rentals

-- 6. How many different district names are there?

SELECT COUNT(DISTINCT district) AS unique_district_count
FROM address;

--378

-- 7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, COUNT(actor_id) AS actor_count
FROM film_actor
GROUP BY film_id
ORDER BY actor_count DESC
LIMIT 1;
--film ID 508 with 15 actors


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT COUNT(*) AS customer_count
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;

-- 0 customers

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT amount, COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING COUNT(amount) > 250

-- 3 payment amounts

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?

SELECT COUNT(DISTINCT rating) AS rating_category_count
FROM film;

--5 rating Categories

SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating
ORDER BY film_count DESC
LIMIT 1;

--PG-13 has 224 count