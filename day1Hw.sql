--Q1

SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

--Answer: 2 names

--Q2

SELECT COUNT(payment_id)
FROM payment 
WHERE 3.99 < amount and amount < 5.99;

-- Answer: 3427 payments

--Q3

SELECT film_id, COUNT(film_id) AS film_count
FROM inventory
GROUP BY film_id 
ORDER BY film_count ASC

SELECT MAX(COUNT(film_id))
FROM inventory

-- Answer: Film id: 856 though quite a few tie

--Q4

SELECT first_name, last_name
FROM customer
WHERE last_name LIKE '%William%'

-- Answer: 0 customers, but 2 Customers have William IN their last name

--Q5

SELECT COUNT(staff_id)
FROM payment
WHERE staff_id = 1

SELECT COUNT(staff_id)
FROM payment
WHERE staff_id = 2

SELECT *
FROM payment

-- Answer: employee ID num 2 at 7304 sales

--Q6

SELECT COUNT(district)
FROM address

-- Answer: 603

--Q7

SELECT  film_id, actor_id
FROM film_actor
WHERE actor_id 
ORDER BY film_id DESC


-- Answer: Film id: 508 has 15 actors

--Q8

SELECT store_id, last_name
FROM customer
WHERE store_id = 1 and last_name LIKE '%es'

-- Answer: 13 Customers

--Q9

SELECT DISTINCT amount, COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING COUNT(amount) > 250

-- Answer: There are 3

--Q10

SELECT DISTINCT rating
FROM film

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating)
-- Answer: There are 5 rating categories and PG-13 has the most at 223








