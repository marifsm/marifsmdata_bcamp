-- chalange 1
-- Who is the customer that has rented the most number of times in the store? ELEANOR HUNT

SELECT customer.customer_id, customer.first_name, customer.last_name, COUNT(*)
FROM customer 
LEFT JOIN rental
ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id
ORDER BY COUNT(*) DESC;

-- Who is the customer that has spent the most in the store? Kent Arsenault

SELECT customer.customer_id, customer.first_name, customer.last_name, payment.amount
FROM customer 
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
ORDER BY payment.amount DESC;


/* Who is the customer that has spent the most in average in the store? (Keep in mind that we want to know 
the average of how much they spent not the total) - Brittany Riley */

SELECT customer.customer_id, customer.first_name, customer.last_name, ROUND(AVG(payment.amount),2)
FROM customer 
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY AVG(payment.amount) DESC;

-- Are they the same person? What conclusions can we draw from here? 
/* Não, eles não são a mesma pessoa. Com esse fato nos podemos tirar 
algumas inferências mercadológicas, pois nem sempre o nosso cliente 
que gastou mais no estabelecimento é o que vai gastar com uma certa 
regularidade. No caso, a longo prazo é mais interessante clientes como 
Brittany Riley, pois eles se mostram ser fiéis e sempre retornar à maca 
tendo uma maior chance de indicar para amigos (pois provavelmente gosta 
do serviço/produto). */

-- CHALLANGE 2 
/* In this challenge, you'll have to create a sql query to retrieve the 5 filmes that have been rented 
the most. */

SELECT film.film_id, film.title, COUNT(*)
FROM film 
LEFT JOIN inventory
ON film.film_id = inventory.film_id 
LEFT JOIN rental
ON inventory.inventory_ID = rental.inventory_id
GROUP BY film.film_id
ORDER BY COUNT(*) DESC
LIMIT 5;

-- CHALLENGE 3
/* In this challenge, you'll have to create a sql query to discover the movies categories that have 
been rented the most.*/
SELECT category.name, category.category_id, COUNT(*)
FROM film 

LEFT JOIN film_category
ON film.film_id = film_category.film_id 

LEFT JOIN category
ON category.category_id = film_category.category_id

LEFT JOIN inventory
ON film.film_id = inventory.film_id 

LEFT JOIN rental
ON inventory.inventory_ID = rental.inventory_id

GROUP BY category.category_id
ORDER BY COUNT(*) DESC
LIMIT 5;


-- CHALLENGE 4 
/* Remeber the challenge 1? Get the top 5 customer and try to see what are the categories of movies that 
they like. */

SELECT category.name, category.category_id, COUNT(*)
FROM customer 

LEFT JOIN rental
ON customer.customer_id = rental.customer_id

LEFT JOIN inventory
ON inventory.inventory_ID = rental.inventory_id

LEFT JOIN film
ON film.film_id = inventory.film_id 

LEFT JOIN film_category
ON film.film_id = film_category.film_id 

LEFT JOIN category
ON category.category_id = film_category.category_id

GROUP BY category.category_id
ORDER BY COUNT(*) DESC
LIMIT 5;





