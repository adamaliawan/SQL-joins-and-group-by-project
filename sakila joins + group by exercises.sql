use sakila;



/***
	Exercises
    ***/
       
    
/* 1) Use `INNER JOIN` to display the first and last names, as well as the address, of each staff member. Use the tables `staff` and `address` */

  SELECT first_name, last_name, a.address 
  FROM staff as s
  inner join address as a
  on s.address_id = a.address_id;
  
/* 2) Use `INNER JOIN` to display the total amount rung up by each staff member in August of 2005. Use tables `staff` and `payment`. */


SELECT SUM(p.amount) AS 'Total Amount', s.first_name, s.last_name
FROM staff as s
INNER JOIN payment as p
ON s.staff_id = p.staff_id
WHERE payment_date between '2005-01-01' and '2005-12-31'
GROUP BY s.first_name, s.last_name;


/* 3) List each film and the number of actors who are listed for that film. Use tables `film_actor` and `film`. Use inner join. */

SELECT title, COUNT(actor_id) AS 'Number of Actors'
FROM film as f
LEFT JOIN film_actor as fa
ON f.film_id = fa.film_id
GROUP BY title
ORDER BY COUNT(actor_id) DESC;


/* 4) How many copies of the film `Hunchback Impossible` exist in the inventory system? */

SELECT count(title) AS 'Number of HI'
FROM film
RIGHT JOIN inventory 
ON film.film_id = inventory.film_id
WHERE title = 'Hunchback Impossible';



/* 5) Using the tables `payment` and `customer` and the `INNER JOIN` command, list the total paid by each customer. List the customers
 alphabetically by last name: */

SELECT c.first_name, c.last_name, SUM(p.amount) AS 'Total Paid'
FROM customer AS c
INNER JOIN payment AS p 
ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY c.last_name;


/* 6) Which actor has appeared in the most films? */

SELECT a.first_name, a.last_name, COUNT(fa.actor_id) as 'Number of Films'
FROM film as f
right join film_actor as fa
ON f.film_id = fa.film_id
inner join actor as a
ON fa.actor_id = a.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY COUNT(fa.actor_id) DESC
LIMIT 1;


/*  7) Find the most common actor surname from the Sakila database */

SELECT a.last_name, count(a.last_name)
FROM film_actor as fa
inner JOIN actor as a
ON fa.actor_id = a.actor_id
GROUP BY a.last_name
ORDER BY count(a.last_name) desc
LIMIT 1;



/* 8) List the last names of actors, as well as how many actors have that last name.*/

SELECT last_name, count(last_name) as 'Number of actors with this name'
FROM actor
GROUP BY last_name;



/* 9) Which last names are not repeated? (Please search for having clause for this exercises) */

SELECT last_name, count(last_name) as 'Number of actors with this name'
FROM actor
GROUP BY last_name
HAVING count(last_name) = 1;


/* 10) Which last names appear more than once? (Please search for having clause for this exercises) */


SELECT last_name, count(last_name) as 'Number of actors with this name'
FROM actor
GROUP BY last_name
HAVING count(last_name) > 1
ORDER BY count(last_name) DESC;