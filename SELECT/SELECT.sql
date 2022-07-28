
select  * from customer c 


/*
 * first select
 */

select * from  customer c 
where first_name like 'Maria'

/*
 * select search customer using id customer
 */

select * from customer c
where customer_id = 123;

/*
 * trap with AND OR
 */

select * from customer c 
where customer_id = 4 and customer_id = 1;

/*
 * using Or with search id
 */

select * from customer c 
where customer_id = 4 or customer_id = 1;

/*
 * filtering ascending sescening defoult is set up asc
 */
select * from film f 
order by film_id asc 

select * from film f 
order by film_id desc

/*
 * using like with % and _
 */

select  TITLE from film f 
where TITLE like 'O%'

/*
 * serch 5 long title
 */

SELECT title FROM film f 
WHERE title LIKE '_____'

/*
 * serch 2 x 5 title
 */
 SELECT title FROM film f 
WHERE title LIKE '_____ _____'

/*
 *  
 */

SELECT title FROM film f 
WHERE title LIKE '%____ %____'

/*
 * select distinct
 */

/*
 * porownanie ilosci klijentow w platnosci 
 */ 

SELECT customer_id  FROM payment p
ORDER BY 1 ASC 

SELECT DISTINCT(customer_id) FROM payment p  
ORDER BY 1 ASC 
LIMIT 5 

SELECT DISTINct(customer_id) ,staff_id   ,payment_date  FROM payment p2 
WHERE amount = 0

select customer_id ,staff_id ,amount, payment_date 
from payment p 
where rental_id >= 1000
AND payment_date BETWEEN '2007-01-01' AND '2007-06-01'
ORDER BY 3 DESC 






