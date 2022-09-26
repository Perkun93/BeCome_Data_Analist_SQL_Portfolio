/*
 * First SELECT just have look how it work*/

SELECT *
FROM customer c 

/*
 * Have you see * give us full Customer table
 * Now we SELECT First name , last name and email. Let's GO 
*/

SELECT first_name , last_name ,email 
FROM customer c 

/*
	* Good job. Now we thing... Maby we need just 10 first row.  
	* Its time to use LIMIT
*/

SELECT first_name , last_name ,email 
FROM customer c
LIMIT 10

/*
	* a z tych 10 intrsuje nas tylko 3.... uzyjmy Ofset  
	* Hmm we have got 10 first record but your colegue ask you can you show row 4 til 7
	* On this situlation you could using OFFSET is very simple.   	
**/


SELECT first_name , last_name ,email 
FROM customer c
LIMIT 3 OFFSET 3

/*
	 * This can be litle beit conufis for you if you dont know why i set offset on 3 
	 * that vey simple. if we wanna get record 4 we begin from row 3 this is zero point for sql next one will be this row witch we looking.
*/

/*
	* All right now we look how we can sort descending our recored 
	* To sort record we using ORDER BY ... Hmmm and you have good thing if wanna do this you need add DESC minss Descending
*/

SELECT first_name , last_name ,email 
FROM customer c
ORDER BY first_name ASC 

/* 


/*
 	* Ascending sort is set up amtomaticli 
  	* You can sort more than one colum 
	* And instead of column name you can use number of column 
	* and sort using cuple column 
 */

SELECT first_name , last_name ,email 
FROM customer c
ORDER BY 1, 2 DESC 


/*
	* Lets go. Time to first where.
	* It is query to filter our record. Hmm ofcoure time for check this on pratise 
 	* Finde customer with ID = 15 

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


