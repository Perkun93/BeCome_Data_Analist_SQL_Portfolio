-- Retrieve all columns from the payment table.
SELECT *
FROM payment p;

/*
 * Let's check what percentage of zero-value transactions are there for both stores
 * using previously acquired knowledge and exploring a new function, namely aggregation.
*/

-- Calculate the total sum of payments made by staff_id 1.
SELECT SUM(amount) AS sum_payments
FROM payment p
WHERE staff_id = 1;

-- Calculate the total sum of payments made by staff_id 2.
SELECT SUM(amount) 
FROM payment p
WHERE staff_id = 2;

/*
 * Now that we have the total value of all transactions from store 1, let's find out how many of them occurred.
*/

-- Count the number of distinct payment_ids for transactions made by staff_id 1.
SELECT COUNT(DISTINCT(payment_id)) AS ALL_PAYMENTS 
FROM payment p
WHERE staff_id = 1;

-- Count the number of payment_ids for transactions with an amount of 0 made by staff_id 1.
SELECT COUNT(payment_id) 
FROM payment p
WHERE amount = 0
AND staff_id = 1;

-- Calculate the percentage of zero-value transactions out of the total transactions for staff_id 1.
SELECT 
  (SELECT COUNT(payment_id) 
    FROM payment p 
    WHERE amount = 0
    AND staff_id = 1
  ) * 100 / COUNT(DISTINCT(payment_id)) 
FROM payment p;
