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
 * Check wich store give us more profit
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
 * sql wciaga. juz wiez ktory sklep jest najbardzeiej dochodowu
 * ale pamietaj uzywajac group by i order by musisz sortowac zawsze po pelnej nazwie 
 * uzytej w select. sql nie lubi aliasow w order by 
 */

/*
 * check stock inventory group by film id 
 */

SELECT *
FROM inventory i 

SELECT store_id , count( store_id) AS stock , film_id 
FROM inventory i
GROUP BY  1,3
ORDER BY count(store_id) DESC

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
 * SQL lubi kolejnosc 
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
 * pratcise with group by and where 
 * 
 */ 

SELECT customer_id, staff_id, sum(amount)
FROM payment p 
WHERE customer_id != (184)
GROUP BY 1,2 
ORDER BY sum(amount) DESC LIMIT 5 


/*
 * as you se != return us all without customer id =1
 * I  show you how select more 
 */

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
 * we will relationsship beetwen mpaa rating and a replemace cost 
 */



SELECT *
FROM film f


SELECT rating , avg(replacement_cost)
FROM film f 
GROUP BY 1

/*
 * great job but looks on numbers its not looking good 
 * lets use ROUND 
 */

SELECT rating , ROUND(AVG(replacement_cost), 2) AS avg_replacement_cost
FROM film f 
GROUP BY 1
ORDER BY AVG(replacement_cost) DESC 

/*
 * now we chceck top 5 customer id 
 */

SELECT customer_id, sum(amount) 
FROM payment p 
GROUP BY 1
ORDER BY sum(amount) DESC 
LIMIT 5

/*
 * time to joins 
 *  Joins lacza tabele po danym kluczu 
 * zobaczmy jeden z joinow 
 * Inner join. laczy tabele A z tabela B po wspolnym kluczu ,ktorym moze byc film ID
 * dla tego sprawdzmy 5 aktorow najczesciej pojawiajacych sie w filmach  
 * jak mowi inner czyli wewnetrzny.
 */


SELECT * 
FROM film f 

SELECT *
FROM actor a 

SELECT fa.actor_id, fa.film_id, a.first_name , a.last_name  
FROM film_actor 		AS fa 
INNER JOIN actor		AS a 
ON fa.actor_id = a.actor_id 


SELECT fa.actor_id, fa.film_id, a.first_name , a.last_name  
FROM film_actor 		AS fa 
INNER JOIN actor		AS a 
ON fa.actor_id = a.actor_id 


SELECT fa.actor_id, count( fa.film_id) AS many_films, a.first_name , a.last_name  
FROM film_actor 		AS fa 
INNER JOIN actor		AS a 
ON fa.actor_id = a.actor_id 
GROUP BY 1,3,4
ORDER BY count(fa.film_id)  DESC 

/*
 * opisac join
 */


























/*
 * kto
 */


SELECT *
FROM film f 

SELECT fa.actor_id, round(count( fa.film_id),1) AS many_films, a.first_name , a.last_name,  avg(f.rental_rate) AS avrage_rental  
FROM film_actor 		AS fa 
INNER JOIN actor		AS a 
ON fa.actor_id = a.actor_id 
LEFT JOIN film 		AS f
ON f.film_id = f.film_id 
GROUP BY 1,3,4
ORDER BY count(fa.film_id)  DESC 
LIMIT 5


SELECT fa.actor_id, count( fa.film_id) AS many_films, a.first_name , a.last_name, avg(f.rental_rate) AS avrage_rental  
FROM film_actor 		AS fa 
INNER JOIN actor		AS a 
ON fa.actor_id = a.actor_id 
INNER  JOIN film 		AS f
ON f.film_id = f.film_id 
GROUP BY 1,3,4
ORDER BY count(fa.film_id)  DESC 
LIMIT 5

SELECT count(*) 
FROM film_actor fa 
WHERE actor_id = 60


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
