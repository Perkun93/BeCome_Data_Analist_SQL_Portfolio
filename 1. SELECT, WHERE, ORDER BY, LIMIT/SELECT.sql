/*
 * pierwszy selec zobaczmy jak TO dziala */

SELECT *
FROM customer c 

/*
 * chcemy tylko pierwsze imie nazwisko i email 
*/

SELECT first_name , last_name ,email 
FROM customer c 

/*
	* dobra robota .. pomyslmy nad czyms innym 
	* wybierzmy 10 pierwsztch wierszy 
*/

SELECT first_name , last_name ,email 
FROM customer c
LIMIT 10

/*
	* a z tych 10 intrsuje nas tylko 3.... uzyjmy Ofset  
	* pamietaj rekord 1 to dla sql 0 dla tego uzymawy 2 w offset
**/


SELECT first_name , last_name ,email 
FROM customer c
LIMIT 1 OFFSET 2

/*
 * posegregujmy alfabetycznie. dla tego uzyjemy asc
*/


SELECT first_name , last_name ,email 
FROM customer c
ORDER BY first_name ASC 

/* 
	*	A teraz w druga strone uzywajac DESC 
*/
SELECT first_name , last_name ,email 
FROM customer c
ORDER BY first_name DESC 


/*
 * sprawdzmy co stanie sie po sortowaniu po dwoch kolumnach 
 */

SELECT first_name , last_name ,email 
FROM customer c
ORDER BY 1, 2 DESC 


/*
 * znajdzmy 15 goscia uzywajac klauzuri whare 

 */


SELECT * 
FROM customer c
WHERE customer_id = 15


/*
 * poszukajmy klientow o imieniu alan 
 * 
 */

SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name = 'Alan'

/*
 * ok swietna robota. teraz uzyjmy znaku specjalego aby wyciagnac wszystkie nazwiska zaczynajace sie na H uzywajac LIKE
*/

SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name LIKE 'H%'

/*
 * mozemy cos dodac extra ... hm moze wybezmy cos  zeby trzeci znak nazwiska mial A jako znak 
*/

SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name LIKE 'H%' AND 
last_name LIKE '__r%'


