
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

select * from film f 
order by film_id asc 

select * from film f 
order by film_id desc

select  TITLE from film f 
where TITLE like 'O%' or film_id = 4


select distinct * from film f 
order by film_id desc
limit 5

select count(film_id) from film f 

select count(distinct film_id) from film 

select * from payment p 
where rental_id >= 1000

select * from payment p 

select staff_id , count(amount), sum(amount)  from payment p
group by 1

select * from address a 

select * from customer c 

/*
 * how many customer in store
 */

select store_id, count(distinct customer_id) as many_client from customer c 
group by 1


/*
 *avrage sales
*/

select store_id, round(avg(distinct customer_id),2) as avrage_amount_order  
from customer c 
	group by 1
	order by 1 desc 
	limit 1 

/*
 * top order city sale
 */
	
select * from customer c

select * from a

select * from address a 

select district ,count( distinct city_id) as sum_city  
from address a 
group by 1
order by count(distinct city_id) desc 

/*
 * find sum order from city 
 */
select district ,count( distinct city_id) as sum_city  
from address a 
inner join customer c 
on a.city_id = c.
group by 1
order by count(distinct city_id) desc 


/*
*ile filmow w danym jezyku]
*srednia dlugosc filmu w oparciu o sklep
*stock sklepu 
*procent zarobku sklepu
 *procent zarabku sklepu w oparciu o date 
*/

select store_id , film_id from inventory i 

select store_id , count( store_id), film_id from inventory i
group by 1,3
order by count(store_id) desc

select film_id from inventory i 
where film_id = 172 and store_id = 1

select  * from payment p 

select customer_id ,first_name,last_name, email, count(payment_id), sum(amount) from payment p
inner join customer c 
using (customer_id)
group by 1 
order by count(payment_id) desc
limit 5