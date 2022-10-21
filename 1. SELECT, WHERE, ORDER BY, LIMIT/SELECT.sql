/*
 * First SELECT just have look how it works
*/

SELECT *
FROM customer c 

/*
 * Have you seen * give us full Customer table
 * Now we SELECT First name , last name and email. Let's GO 
*/

SELECT first_name , last_name ,email 
FROM customer c 

/*
 * Good job. Now you think... What if we need just 10 first row ? 
 * It's time to use LIMIT
*/

SELECT first_name , last_name ,email 
FROM customer c
LIMIT 10

/*
 * From those 10 rows we are interesting only three rows between 4 and 7  
 * On this situation you could using OFFSET is very simple.   	
*/


SELECT first_name , last_name ,email 
FROM customer c
LIMIT 3 OFFSET 3

/*
 * This can be little bit confused for you if you don't know why I had set up OFFSET on 3 
 * That vety simple. If we want get record 4 we begin from row 3 this is point zero for sql next one will be this row witch we looking.
*/

/*
 * All right now we look how we can sort descending our recored 
 * To sort record we are using ORDER BY ... 
 * We are should use DESC to sort Descending
 *
*/

SELECT first_name , last_name ,email 
FROM customer c
ORDER BY first_name DESC 

/*
 * Ascending sort is set up automatically
 * You can sort more than one column
 * And instead of column name you can use number of column 
 */

SELECT first_name , last_name ,email 
FROM customer c
ORDER BY 1, 2 DESC 


/*
* Lets go. Time for your first WHERE.
* It is query to filter our record. Hmm ofcourse time for check this in practice  
* Find customer with ID = 15 
*/


SELECT * 
FROM customer c
WHERE customer_id = 15


/*
 * We looking customer WHEARE first name is 'Alan'   
 */

SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name = 'Alan'

/*
 * Great job. Next step will be using LIKE. Yeah LIKE look how it working
 */

SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name LIKE 'H%'



/*
 * I had used special mark %. That mean after H can be everything.
 * Just have look 
 */

SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name LIKE 'H%' AND 
last_name LIKE '__r%'





/*
 * Look below  
 * We are compare LIKE with using ___ and %
 */


SELECT * 
FROM customer c 
WHERE first_name LIKE '__'

SELECT * 
FROM customer c 
WHERE first_name NOT LIKE '__'

SELECT * 
FROM customer c 
WHERE first_name LIKE '%'

SELECT * 
FROM customer c 
WHERE first_name NOT LIKE '%'


/*
 * Time for count somethings 
 * Lets start
 */

SELECT amount 
FROM payment p 

SELECT count(amount)
FROM payment p 

/*
 * Score is 14596
 * We can using alias to name column 
 */

SELECT count(amount) AS all_amount
FROM payment p 

/*
 * Lets we check unique rows in AMOUNT column
 */

SELECT count(DISTINCT (amount))
FROM payment p 

 
/*
* Try use function MAX
*/

SELECT max(amount)
FROM payment p 

/*
 * And function MIN
*/

SELECT min(amount)
FROM payment p 


/*
 * Have you seen function MIN returned us volume 0  
 * We need check this
*/

SELECT *
FROM payment p 
WHERE amount = 0

SELECT count(payment_id) AS no_payments
FROM payment p 
WHERE amount = 0

/*
 * For 24 the transaction we did not receive payment
 */

/*
 * Next step time for AND and OR
 * We are use this with LIKE 
 */

SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name LIKE 'H%' OR 
last_name LIKE '__r%'

SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name LIKE 'H%' OR 
last_name NOT LIKE '__r%'


SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name LIKE 'H%' AND 
last_name LIKE '__r%'


SELECT customer_id , first_name , last_name ,email 
FROM customer c
WHERE first_name LIKE 'H%' AND 
last_name NOT LIKE '__r%'


/*
 * Important is sorting on date 
 */


SELECT payment_id , staff_id , payment_id  
FROM payment p 
WHERE payment_date 
BETWEEN  '2007-02-19' AND '2007-02-20' 


SELECT payment_id , staff_id , payment_id  
FROM payment p 
WHERE payment_date 
BETWEEN  '2007-02-19' AND '2007-02-20' 
AND staff_id = 2


SELECT count(payment_id)  
FROM payment p 
WHERE payment_date 
NOT BETWEEN  '2007-02-19' AND '2007-02-20' 
AND staff_id = 2

SELECT count(payment_id)  
FROM payment p 
WHERE payment_date 
BETWEEN  '2007-02-19' AND '2007-02-20' 
AND staff_id = 2

SELECT count(payment_id)  
FROM payment p 
WHERE payment_date 
BETWEEN  '2007-02-19' AND '2007-02-20' 
AND staff_id = 2 
OR customer_id BETWEEN '33' AND '50' 



/*
 * Let's compare sale between store on date 15-02-2007
 */

SELECT *
FROM payment p 
WHERE  payment_date  
BETWEEN '2007-02-15' AND '2007-02-17'