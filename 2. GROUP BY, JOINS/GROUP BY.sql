/*
 * Today we will learn how group by our result
 * As you know we are using WHEARE to filtering rows 
 * But remeber GROUP BY we are using alwase after WHERE 
 */

SELECT *
FROM customer c 

/*
 * Now we see full customer table
 * Next step. We will compare how many customers by store 
 * Let's GROUP BY customers using customer_id. Customer_id is a unique number 
*/


SELECT store_id, count(customer_id) AS ALL_transaction 
FROM customer c 
GROUP BY 1

/*
 * Very well. Now you see how GROUP BY does work 
 * Check which store give us more profit
*/

SELECT staff_id , count(*)
FROM payment p 
GROUP BY 1 
ORDER BY count(*) DESC  

/*
 * Add sum all amount transactions 
 */

SELECT staff_id , count(*) AS transctions ,  sum(amount) AS sum_of_amount 
FROM payment p 
GROUP BY 1 
ORDER BY sum(amount) DESC 

/*
 * SQL is really cool. I already know which store is the most profitable
 * SQL don't like alias in ORDER BY that's why we are using full name in ORDER BY
 */

/*
 * Check stock inventory group by film id 
 */

SELECT *
FROM inventory i 

SELECT store_id , count(store_id) AS stock , film_id 
FROM inventory i
GROUP BY  1,3
ORDER BY count(store_id) DESC

/*
 * To sort agregate functions we are using HAVING 
*/
 
SELECT store_id , count( store_id) AS stock  , film_id 
FROM inventory i
GROUP BY  1,3
HAVING  store_id = 1
ORDER BY count(store_id) DESC


SELECT store_id , count(store_id), film_id 
FROM inventory i
WHERE film_id = 120
GROUP BY  1,3
HAVING  store_id = 1


/*
 * IMPORTANT
 * 1. SELECT
 * 2. FROM
 * 3. JOIN (later)
 * 4. WHERE
 * 5. GROUP BY
 * 6. HAVING
 * 7. ORDER BY 
 * 8. LIMIT
 */

/*
 * Practice with GROUP BY and WHERE 
 * 
 */ 


SELECT customer_id, staff_id, sum(amount)
FROM payment p 
GROUP BY 1,2 
ORDER BY sum(amount) DESC LIMIT 5 


SELECT customer_id, staff_id, sum(amount)
FROM payment p 
WHERE customer_id != 137
GROUP BY 1,2 
ORDER BY sum(amount) DESC LIMIT 5 


/*
 * As you see != return us all without customer id = 184
 * You can use =, !=, <, > 
 */

/*
 * Or you can use IN and on this situation NOT IN 
 * Have you see number is in bracket 
 * Because IN or NOT IN defines the set 
 */

SELECT customer_id, staff_id, sum(amount)
FROM payment p 
WHERE customer_id NOT IN (137)
GROUP BY 1,2 
ORDER BY sum(amount) DESC LIMIT 5 

/*
 * Look how use IN and NOT IN 
 */

SELECT customer_id, sum(amount), count(customer_id) AS transactions
FROM payment p 
WHERE customer_id IN  (87,477,273,51)
GROUP BY 1 
HAVING sum(amount) > 100
ORDER BY count(customer_id) DESC 

SELECT customer_id, sum(amount), count(customer_id) AS transactions  
FROM payment p 
WHERE customer_id NOT IN  (87,477,273,51)
GROUP BY 1 
HAVING sum(amount) > 100
ORDER BY count(customer_id) DESC 



SELECT count(*)
FROM payment p 
WHERE customer_id = 148

/*
 * Now we are check relationship between MPAA rating and a replace cost
 */

SELECT *
FROM film f


SELECT rating , avg(replacement_cost)
FROM film f 
GROUP BY 1

/*
 * Great job but looks on numbers it's not looking good 
 * Lets use ROUND 
 */

SELECT rating , ROUND(AVG(replacement_cost), 2) AS avg_replacement_cost
FROM film f 
GROUP BY 1
ORDER BY AVG(replacement_cost) DESC 

/*
 * Now we check top 5 customer id 
 */

SELECT customer_id, sum(amount) 
FROM payment p 
GROUP BY 1
ORDER BY sum(amount) DESC 
LIMIT 5

/*
 * Time for joins 
 * A JOIN is a means for combining fields from two tables by using values common to each.
 * SQL JOINS... INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN , CROSS JOIN 
 */

/* INEER JOIN 
 *
 * Table A	Table B
 * 1		10
 * 2		1
 * 3   		3
 * 4		3	
 * 5		28
 * Return us  1 - 1, 3 - 3, 3 - 3.
 *
 * LEFT JOIN
 *
 * Table A	Table B
 * 1		10
 * 2		1
 * 3   		3
 * 4		3	
 * 5		28
 * Return us  1 - 1, 2, 3 - 3, 4, 5
 * 
 * RIGHT JOIN
 *
 * Table A	Table B
 * 1		10
 * 2		1
 * 3   		3
 * 4		3	
 * 5		28
 * Return us  10, 1 - 1, 3 - 3, 3 - 3, 28
 *
 * FULL OUTER JOIN
 *
 * Table A	Table B
 * 1		10
 * 2		1
 * 3   		3
 * 4		3	
 * 5		28
 * Return us  1 - 1, 3 - 3
 *
 * CROSS JOIN
 *
 * Table A	Table B
 * 1		10
 * 2		1
 * 3   		3
 * 4		3	
 * 5		28
 * Return us  1 - 10, 1 - 1, 1 - 3, 1 - 3, 1 - 28, 2 - 10, 2 - 1, 2 - 3, 2 - 3, 2 - 28 .....
*/

/*
 * Do this FIRST JOIN
 * Combin fields from table FILMS and ACTOR using INNER JOIN
 */

SELECT * 
FROM film f 

SELECT *
FROM actor a 

SELECT fa.actor_id, fa.film_id, a.first_name , a.last_name  
FROM film_actor 		AS fa 
INNER JOIN actor		AS a 
ON fa.actor_id = a.actor_id 

/*
 * To combining fields from two tables we are need alias table 
 */


SELECT fa.actor_id, fa.film_id, a.first_name , a.last_name  
FROM film_actor 		AS fa 
INNER JOIN actor		AS a 
ON fa.actor_id = a.actor_id 

/*
 * Time for traning open your mind
 */


SELECT fa.actor_id, count( fa.film_id) AS Performed_films, a.first_name , a.last_name  
FROM film_actor 		AS fa 
INNER JOIN actor		AS a 
ON fa.actor_id = a.actor_id 
GROUP BY 1,3,4
ORDER BY count(fa.film_id)  DESC 
LIMIT 10

/*
 * We can check 
 */

SELECT count(*) 
FROM film_actor fa 
WHERE actor_id = 107


SELECT fa.actor_id, a.first_name , a.last_name,  count( fa.film_id) AS many_films, round(sum(f.rental_rate),2) AS sum_amount  
FROM film_actor 		AS fa 
INNER JOIN actor		AS a 
ON fa.actor_id = a.actor_id 
INNER JOIN film 		AS f
ON f.film_id = f.film_id 
GROUP BY 1,2,3
ORDER BY count(fa.film_id)  DESC 
LIMIT 5

/*
 * most amount film 
 */

SELECT *
FROM payment p 

SELECT * FROM rental r 

SELECT *
FROM film f 

SELECT * 
FROM inventory i 

SELECT f.film_id, f.title, sum(p.amount)
FROM film f 
LEFT JOIN inventory i 
ON f.film_id = i.film_id 
LEFT JOIN rental r 
ON i.inventory_id = r.inventory_id 
LEFT JOIN payment p 
ON r.rental_id = p.rental_id
WHERE p.amount IS NOT NULL
GROUP BY 1,2 
ORDER BY sum(p.amount) DESC 

/*
 * 
 */

SELECT count(*)
FROM film f 
LEFT JOIN inventory i 
ON f.film_id = i.film_id 
LEFT JOIN rental r 
ON i.inventory_id = r.inventory_id 
LEFT JOIN payment p 
ON r.rental_id = p.rental_id
WHERE p.amount IS NULL




SELECT p.payment_id 
FROM payment p 
le


SELECT film_id 
FROM inventory i 
WHERE film_id = 172 AND store_id = 1

select  * from payment p 

SELECT customer_id ,first_name,last_name, email, count(payment_id), sum(amount) 
FROM payment p
INNER JOIN customer c 
USING (customer_id)
GROUP BY 1 
ORDER BY count(payment_id) DESC
LIMIT 5



/*
*ile filmow w danym jezyku]
*srednia dlugosc filmu w oparciu o sklep
*stock sklepu 
*procent zarobku sklepu
 *procent zarabku sklepu w oparciu o date 
*/

/*
 * suma stocku sklepu w oparciu o wymiane 
 */


SELECT * FROM inventory i 

SELECT * FROM store s 

SELECT * 
FROM film f 

SELECT s.store_id , sum(f.replacement_cost)  
FROM film 						AS f 
LEFT JOIN inventory				AS i 
ON f.film_id = i.film_id 
LEFT JOIN store 				AS s 
ON i.store_id = s.store_id
GROUP BY 1
ORDER BY sum(f.replacement_cost) DESC 

/*
 * daje nam to pytanie gdzie sa gilmy z pozycji 3 
 */
SELECT i.film_id _id , sum(f.replacement_cost), f.film_id 
FROM film 						AS f 
LEFT JOIN inventory				AS i 
ON f.film_id = i.film_id
WHERE i.store_id IS NULL 
GROUP BY 1,3
ORDER BY sum(f.replacement_cost) DESC 

/*
 * As you see 
 */
/*
 * top order city sale
 */
	
 

SELECT district AS City,count(DISTINCT city_id) AS sum_city  
FROM address a 
GROUP BY 1
ORDER BY count(DISTINCT city_id) DESC 




SELECT fa.actor_id, round(count( fa.film_id),1) AS many_films, a.first_name , a.last_name,  avg(f.rental_rate) AS avrage_rental  
FROM film_actor 		AS fa 
INNER JOIN actor		AS a 
ON fa.actor_id = a.actor_id 
LEFT JOIN film 		AS f
ON f.film_id = f.film_id 
GROUP BY 1,3,4
ORDER BY count(fa.film_id)  DESC 
LIMIT 5