-- Get ALL Records from a query
SELECT *
FROM film;

-- Limit out Results

SELECT * 
FROM film
LIMIT 10;

--Omits some results and limit

SELECT *
FROM film
LIMIT 10 OFFSET 5;

SELECT * FROM actor;

SELECT first_name, last_name
FROM actor;

-- Finds actor that first name is Nick
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

SELECT *
FROM film
WHERE film_id = 85

-- Finds actor that first name is Nick using LIKE
SELECT first_name, last_name
FROM actor
WHERE first_name = LIKE 'Nick';

-- _any 1 character and % any 0 or more number of character

-- Where the name starts with a J

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- Query names containing a y
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE '%y' OR first_name LIKE 'Y%'

-- K names that are 2 letters long
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'k__';

-- first_names that start with K end with th and have at least 2 characters between the k and the th

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%th';

SELECT first_name, last_name
FROM actor
WHERE first_name = 'Kenneth' and last_name = 'Torn';

SELECT * FROM payment;

-- Comparison operators:
-- >< >= <= <> [not equals]
-- Query the Payment tables customers who paid an amount greater than $2

SELECT customer_id, amount
FROM payment 
WHERE 2.00 < amount and amount < 4.99;

SELECT customer_id, amount
FROM payment 
WHERE 3.00 > amount and amount != 2.99;

-- Order by a column Descending
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount DESC;

-- Order by a column Ascending
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC;

--Order by a column Ascending
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount;

SELECT customer_id, amount
FROM payment 
WHERE amount BETWEEN 2.00 AND 7.99
ORDER BY amount DESC;

--SQL aggregations SUM, AVG, COUNT, MIN, MAX
--The sum of all amounts paid
SELECT SUM(amount)
FROM payment 
WHERE amount > 5.99;

-- Count -- How many records
SELECT COUNT(amount)
FROM payment
WHERE amount >5.99;

-- Get unique first names (no dups)
SELECT DISTINCT first_name
FROM actor;

-- How many unique payment amounts did we have
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- Average payment amount
SELECT AVG(amount)
FROM payment;

-- Min amount in payment
SELECT MIN(amount) AS Min_Payment
FROM payment
WHERE amount <> 0;

--Max amount in payment
SELECT MAX(amount) AS Max_Payment
FROM payment;

SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount;

--Query to display different customer_ids WITH
-- summed amounts for each customer_id
SELECT customer_id, SUM(amount) as soa
FROM payment
GROUP BY customer_id
ORDER BY soa DESC;

-- Query to display customer_ids with the amounts for each customer_id
SELECT customer_id, amount
FROM payment
GROUP BY customer_id, amount
ORDER BY amount DESC;

SELECT customer_id, SUM(amount) as soa
FROM payment
GROUP BY customer_id
HAVING SUM(amount)>71
ORDER BY soa DESC
LIMIT 20 OFFSET 5;

-- Query to display customer emails that show up more than 5 times
-- Grouping by the customer's email
-- and the email contains the name 'bishop'

SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE '%bishop%'
GROUP BY email
HAVING COUNT(customer_id) > 5
ORDER BY email LIMIT 1;
