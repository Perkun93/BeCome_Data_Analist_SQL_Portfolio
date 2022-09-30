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
 * We looking customare alan name 
 * 
 */

SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name = 'Alan'

/*
 * Grate job. next step will be using LIKE. Yea LIKE look how it working
*/

SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name LIKE 'H%'



/*
 * I use special mark % that mean after H can be everything.
 * Just have look 
*/

SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name LIKE 'H%' AND 
last_name LIKE '__r%'

/*
 * jak mozesz zobaczyv % odpowanda za wszyskie znaki nie wana jest dlugosc lecz _ odpowada za kazdy pojedynczy znak 
 * */


/*
* pora na cos nowego
*/

SELECT *
FROM payment p 

/* wyciagnijmy cene produktow funkcja count liczt ilisc wierszy lecz gdy dodamy distinc to uzyskamly liczbe unikal;nych wierszy wiec sprawdzmy to 
 * 
 */

SELECT amount 
FROM payment p 

SELECT count(amount)
FROM payment p 

/*
 * wynik 14596
 */

SELECT count(DISTINCT (amount))
FROM payment p 

/*
* wynik 19
* wiec to dziala 
 **/
 
/*
* sprawdzmy najwyzsza cene uzywyajac max
*/

SELECT max(amount)
FROM payment p 

/*
 * i najnizsza uzyjacac min 
*/

SELECT min(amount)
FROM payment p 


/*
* jak widzisz minimalna cena jest 0 cos tu nie gra wiedz sprawmy co przykominajac sobie where 
*/

SELECT *
FROM payment p 
WHERE amount = 0

SELECT count(payment_id) 
FROM payment p 
WHERE amount = 0

/*
 * 24 klientow nie zaplacilo w sklepie 
*/


SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name LIKE 'H%' OR 
last_name LIKE '__r%'

SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name LIKE 'H%' OR 
last_name NOT LIKE '__r%'

/*
 * You can very SIMPLE sort date 
 * look on payment table
*/

SELECT *
FROM payment p 




/*
 * try sort pament date between 
 */


SELECT payment_id , staff_id , payment_id  
FROM payment p 
WHERE payment_date 
BETWEEN  '2007-02-19' AND '2007-02-20' 
AND staff_id = 2

SELECT count(payment_id)  
FROM payment p 
WHERE payment_date 
BETWEEN  '2007-02-19' AND '2007-02-20' 
AND staff_id = 2


SELECT count(payment_id)  
FROM payment p 
WHERE payment_date 
NOT BETWEEN  '2007-02-19' AND '2007-02-20' 
AND staff_id = 2



/*
 * remember if you usin and must be after betwen 
 * hmm checy OR
 */

SELECT payment_id , staff_id , payment_id  
FROM payment p 
WHERE payment_date >  '2007-02-19' 

SELECT payment_id , staff_id , payment_id  
FROM payment p 
WHERE payment_date !=  '2007-02-19' 
AND  staff_id = 2



