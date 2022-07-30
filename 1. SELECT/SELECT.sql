
SELECT * 
FROM address a 

		SELECT *
			FROM customer c 



/*
 * how many customer in store using AS to create alias using count
 */

		SELECT store_id, count(DISTINCT customer_id) AS many_client 
		FROM customer c 
		GROUP BY  1


/*
 *avrage sales using avg and round
*/

SELECT store_id, round(avg(DISTINCT customer_id),2) AS avrage_amount_order  
FROM customer c 
	GROUP BY 1
	ORDER BY 1 DESC 
	LIMIT 1 

/*
 * top order city sale
 */
	

SELECT district AS City,count(DISTINCT city_id) AS sum_city  
FROM address a 
GROUP BY 1
ORDER BY count(DISTINCT city_id) DESC 



/*
*ile filmow w danym jezyku]
*srednia dlugosc filmu w oparciu o sklep
*stock sklepu 
*procent zarobku sklepu
 *procent zarabku sklepu w oparciu o date 
*/

SELECT store_id , film_id from inventory i 

SELECT store_id , count( store_id), film_id 
FROM inventory i
GROUP BY  1,3
ORDER BY count(store_id) DESC

SELECT film_id 
FROM inventory i 
WHERE film_id = 172 AND store_id = 1

select  * from payment p 

SELECT customer_id ,first_name,last_name, email, count(payment_id), sum(amount) 
FROM payment p
INNER JOIN customer c 
USING (customer_id)
GROUP BY 1,2,3,4 
ORDER BY count(payment_id) DESC
LIMIT 10

SELECT p.customer_id ,c.first_name,c.last_name, c.email, count(p.payment_id), sum(p.amount) 
FROM payment		as p
LEFT JOIN customer  as c 
USING (customer_id)
GROUP BY 1,2,3,4  
ORDER BY count(p.payment_id) DESC
LIMIT 10

SELECT p.customer_id ,c.first_name,c.last_name, c.email, count(p.payment_id), sum(p.amount) 
FROM payment		as p
FULL JOIN customer  as c 
USING (customer_id)
GROUP BY 1,2,3,4  
ORDER BY count(p.payment_id) DESC
LIMIT 10

SELECT p.customer_id ,c.first_name,c.last_name, c.email, count(p.payment_id), sum(p.amount) 
FROM payment		as p
FULL OUTER JOIN customer  as c 
USING (customer_id)
GROUP BY 1,2,3,4  
ORDER BY count(p.payment_id) DESC
LIMIT 2


SELECT p.customer_id ,c.first_name,c.last_name, c.email, count(p.payment_id), sum(p.amount) 
FROM payment		as p
RIGHT JOIN customer  as c 
USING (customer_id)
GROUP BY 1,2,3,4  
ORDER BY count(p.payment_id) DESC
LIMIT 10