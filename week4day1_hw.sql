-- Homework 
--do cdm and upload this to github, post link

--Question 1
--How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';
--- 2 actors

--Question 2
--How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
--- 5607 payments

--Question 3
--What film does the store have the most of? (search in inventory)
SELECT *
FROM inventory;

SELECT inventory_id, film_id, store_id
FROM inventory
ORDER BY inventory_id DESC;
--4581, 1000, 2
SELECT *
FROM film
WHERE film_id = '1000';
---Zorro Ark

--Question 4
--How many customers have the last name ‘William’?
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';
--- 0 customers

--Question 5
--What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id
ORDER BY staff_id;
--1:8040 2:8004
SELECT *
FROM staff;
---Staff ID: 1 Mike sold the most rentals.

--Question 6
--How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;
--- 378 different districts

--Question 7
--What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(film_id)
FROM film_actor
GROUP BY film_id
ORDER BY count DESC;
--id 508 count 15
SELECT *
FROM film
WHERE film_id = 508;
--- Lambs Cincinatti has 15 actors

--Question 8
--From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;
--- 13 customers

--Question 9
--How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)

SELECT amount, COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount)>250;
--- 3 payment amounts: 2.99 4.99 0.99

--Question 10
--Within the film table, how many rating categories are there? And what rating has the most
--movies total?
SELECT DISTINCT rating, COUNT( rating)
FROM film
GROUP BY rating
ORDER BY rating;
--- 5 rating categories / PG-13 with 223 movies