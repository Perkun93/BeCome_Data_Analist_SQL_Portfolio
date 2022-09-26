/*
 * nauczymy sie dzis nowej funkcji grupopania 
 * jak wiesz z poprzednich wierszow do filtrowaia uzywany WHARE 
 * lecz mozemy pogrupowac nasze wyniki wzgledem czegos np imienia nazwiska kraju pochodzenia czy nawet ilosci zamowien ....
 *  wiec co zrob my to sprawdzmy jak to dziala
 * uzywajac i uczac sie group by  
 */

SELECT *
FROM customer c 

/*
 * mamy juz wszuuystki customerow uzywajac aliasow tzn podpisania kolumn 
 * zobaczmy ile lientow zrobilo zakuipy w danym sklepie 
 */


SELECT store_id, count(*) AS ALL_transaction 
FROM customer c 
GROUP BY 1

/*
 * brawo mamy to jak widzisz w store id 1 bylo najwiecej tranzakcji 
 */

/*
 * sprawdmy ktroy sklep dal najwiecej tranzakcji
 */

SELECT staff_id , count(*)
FROM payment p 
GROUP BY 1 

/*
 * a teraz zobaczmy jaka byla ich suma 
 */


SELECT staff_id , sum(amount) AS sum_of_amount 
FROM payment p 
GROUP BY 1 
ORDER BY sum(amount) DESC 

/*
 * sql wciaga. juz wiez ktory sklep jest najbardzeiej dochodowu
 * ale pamietaj uzywajac group by i order by musisz sortowac zawsze po pelnej nazwie 
 * uzytej w select. sql nie lubi aliasow w order by 
 */


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
GROUP BY 1 
ORDER BY count(payment_id) DESC
LIMIT 5