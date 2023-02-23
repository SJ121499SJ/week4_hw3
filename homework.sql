-- 1) List all customers who live in Texas (use JOINs)

SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';


-- 2) Get all payments above $6.99 with the customer's full name 

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
);

-- 3) Show all customers names who have made payments over $175 (use subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

-- 4) List all customers that live in Nepal (use the city table)

SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.address_id = city.city_id
WHERE country_id = 66;


-- 5) Which staff members had the most transactions

SELECT first_name, last_name
FROM staff
WHERE staff_id IN (
    SELECT staff_id
    FROM payment
    GROUP BY staff_id
    ORDER BY COUNT(payment_id) DESC
);

-- 6) How many movies of each rating are there?

SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating;

-- 7) Show all customers who have made a single payment abbove $6.99 (use subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
);

-- 8) How many free rentals did our stores give away? 

SELECT COUNT(rental_id)
FROM rental
WHERE rental_id IN(
    SELECT rental_id
    FROM payment
    WHERE amount = 0
);


