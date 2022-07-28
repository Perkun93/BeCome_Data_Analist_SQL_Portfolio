
select * from address a 

select * from customer c 



/*
 * how many customer in store using AS to create alias using count
 */

select store_id, count(distinct customer_id) as many_client 
from customer c 
group by 1


/*
 *avrage sales using avg and round
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

select * from address a 

select district AS City,count( distinct city_id) as sum_city  
from address a 
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