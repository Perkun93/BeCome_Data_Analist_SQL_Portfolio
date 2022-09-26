


SELECT *
FROM payment p 


/*
 * sprawdmy jaki jest procent zorowych tranzakcji dla obu sklepoiw uzywajac wczesniej nabyterj wiedzyt i poznajac nowa funkcje tzn agregbacje
*/

SELECT sum(amount) AS sum_payments
FROM payment p 
WHERE staff_id = 1

SELECT sum(amount) 
FROM payment p 
WHERE staff_id = 2

/*
 *  jak juz mamy wartosc wszystkichj tranzakjci z sklepu 1 sprawdzmy ile ich bylo 
*/

SELECT count(DISTINCT(payment_id))  AS ALL_PAYMENTS 
FROM payment p 
WHERE staff_id = 1


SELECT count(payment_id) 
FROM payment p 
WHERE amount = 0
AND staff_id = 1


SELECT (SELECT count(payment_id) 
FROM payment p 
WHERE amount = 0
AND staff_id = 1
) * 100 /  count(DISTINCT(payment_id)) 
FROM payment p 