CREATE DATABASE Ecommerce;
SELECT customer_id, customer_city, customer_state FROM customers;
SELECT customer_unique_id, customer_zip_code_prefix FROM customers;
SELECT order_id, customer_id, order_status, order_delivered_customer_date FROM orders;
SELECT * FROM customers;
SELECT * FROM customers WHERE customer_state = "MG";
SELECT * FROM customers WHERE customer_state = "SP";
SELECT * FROM customers WHERE customer_state = "SC";
SELECT * FROM customers WHERE customer_city = "franca";
SELECT * FROM customers WHERE customer_city = "sao paulo";

SELECT * FROM orders WHERE order_status = "canceled";
SELECT * FROM orders WHERE order_status = "delivered";

SELECT * FROM payments WHERE payment_type = "UPI" AND payment_value >= 500;
SELECT * FROM payments WHERE payment_type = "credit_card" AND payment_value >= 500;
SELECT * FROM payments WHERE payment_type = "credit_card" AND payment_value > 1000 AND payment_installments = 1;
SELECT * FROM payments WHERE payment_type = "UPI" AND payment_installments = 8 AND payment_value < 500;
SELECT * FROM payments WHERE payment_type = "credit_card" AND payment_value > 1000 AND payment_installments = 2;
SELECT * FROM customers WHERE customer_state = "SP" OR customer_state = "MG" OR customer_state = "SC";
SELECT * FROM products WHERE product_category = "perfumery" AND product_photos_qty = 1 AND product_weight_g > 250 AND product_length_cm < 20
AND product_height_cm < 20 AND product_width_cm < 20;
SELECT * FROM products WHERE product_category = "perfumery" AND product_photos_qty = 1 AND product_weight_g > 250 AND product_length_cm > 20
AND product_height_cm > 20 AND product_width_cm > 20;
SELECT * FROM customers WHERE NOT(customer_state = "SP" OR customer_state = "MG");
SELECT * FROM customers WHERE NOT(customer_state = "SC" OR customer_state = "PA");
SELECT * FROM payments WHERE payment_value BETWEEN 150 AND 200;
SELECT * FROM payments WHERE NOT(payment_type = "UPI" OR payment_type = "credit_card" OR payment_type = "debit_card");
SELECT * FROM payments WHERE payment_sequential BETWEEN 1 AND 2;
SELECT * FROM payments WHERE payment_sequential BETWEEN 3 AND 4;
SELECT * FROM customers WHERE customer_state IN ("SP", "SC", "MG", "PR", "PA");
SELECT * FROM customers WHERE customer_state NOT IN ("SP","SC", "MG", "PR", "PA");
SELECT * FROM customers WHERE customer_city LIKE "r%";
SELECT customer_city FROM customers WHERE customer_city LIKE "r%";
SELECT * FROM customers WHERE customer_city LIKE "f%";
SELECT customer_city FROM customers WHERE customer_city LIKE "f%";
SELECT * FROM sellers WHERE seller_city LIKE "c%";
SELECT seller_city FROM sellers WHERE seller_city LIKE "c%";
SELECT * FROM sellers WHERE seller_city LIKE "%a";
SELECT seller_city FROM sellers WHERE seller_city LIKE "%a";
SELECT seller_city FROM sellers WHERE seller_city LIKE "%de";

SELECT * FROM payments ORDER BY payment_value;
SELECT payment_value FROM payments ORDER BY payment_value;
SELECT * FROM payments ORDER BY payment_installments;
SELECT payment_installments FROM payments ORDER BY payment_installments;
SELECT * FROM payments ORDER BY payment_value DESC;
SELECT payment_value FROM payments ORDER BY payment_value DESC;
SELECT * FROM payments ORDER BY payment_installments DESC;
SELECT payment_installments FROM payments ORDER BY payment_installments DESC;
SELECT payment_value, payment_type FROM payments ORDER BY payment_value, payment_type DESC;
SELECT * FROM payments WHERE payment_installments = 1 ORDER BY payment_value;
SELECT * FROM payments WHERE payment_installments = 1 ORDER BY payment_value DESC;
SELECT * FROM payments LIMIT 2,3;
SELECT * FROM payments LIMIT 5;

SELECT round(sum(payment_value),2) AS total_revenue FROM payments;
SELECT sum(product_name_length) AS total_length FROM products;
SELECT sum(customer_zip_code_prefix) AS total FROM customers;
SELECT round(MAX(payment_value),0) AS total_value FROM payments;
SELECT round(AVG(payment_value),2) AS total_avg FROM payments;
SELECT COUNT(customer_id) AS total_customers FROM customers;
SELECT count(DISTINCT customer_city) AS total_cities  FROM customers;
SELECT COUNT(DISTINCT customer_state) FROM customers;
SELECT seller_city, length(seller_city) FROM sellers;
SELECT seller_state, length(seller_state) FROM sellers;
SELECT seller_city, count(seller_city) FROM sellers
GROUP BY (seller_city);
SELECT seller_city, length(trim(seller_city)) FROM sellers;
SELECT UPPER(seller_city), LOWER(seller_city) FROM sellers;
SELECT seller_city, REPLACE(seller_city, "a", "i") FROM sellers;
SELECT seller_city, REPLACE(seller_city, "i", "u") FROM sellers;
SELECT CONCAT(seller_city," - ", seller_state) AS city_state FROM sellers;
SELECT *, CONCAT(seller_city," - ", seller_state) AS city_state FROM sellers;

SELECT order_delivered_customer_date, DAY(order_delivered_customer_date) FROM orders;
SELECT order_delivered_customer_date, DATE(order_delivered_customer_date) FROM orders;
SELECT order_delivered_customer_date, YEAR(order_delivered_customer_date) FROM orders;
SELECT order_delivered_customer_date, day(order_delivered_customer_date), MONTH(order_delivered_customer_date),
monthname(order_delivered_customer_date), DATE(order_delivered_customer_date), YEAR(order_delivered_customer_date),
dayname(order_delivered_customer_date) FROM orders;

SELECT payment_value, ceil(payment_value), FLOOR(payment_value) FROM payments;

SELECT * FROM orders WHERE order_delivered_customer_date IS NULL;
SELECT * FROM orders WHERE order_delivered_carrier_date IS NULL;
SELECT order_status, COUNT(order_status) AS order_count FROM orders
GROUP BY order_status ORDER BY order_count DESC;
SELECT payment_type, count(payment_type) AS payment_types FROM payments
GROUP BY payment_type ORDER BY payment_types DESC;
SELECT payment_type, ROUND(AVG(payment_value),2) FROM payments
GROUP BY payment_type;
SELECT payment_type, ROUND(MAX(payment_value),0) FROM payments
GROUP BY payment_type;
SELECT payment_type, ROUND(AVG(payment_value),2) FROM payments WHERE payment_installments = 1
GROUP BY payment_type;
SELECT payment_type, ROUND(AVG(payment_value),2) FROM payments
GROUP BY payment_type HAVING AVG(payment_value) >= 100;
SELECT payment_type, COUNT(payment_value) FROM payments
GROUP BY payment_type HAVING COUNT(payment_value) <= 6000;

SELECT customers.customer_id,
orders.order_status FROM customers JOIN orders
ON customers.customer_id = orders.customer_id
WHERE order_status = "canceled";

SELECT order_items.order_id,
orders.order_status FROM order_items JOIN orders
ON order_items.order_id = orders.order_id
WHERE order_status = "canceled";

SELECT orders.order_id,
payments.payment_value FROM orders JOIN payments
ON orders.order_id = payments.order_id;

SELECT customers.customer_id, 
orders.order_status FROM customers JOIN orders
ON customers.customer_id = orders.customer_id
WHERE order_status = "canceled";

SELECT orders.order_id,
payments.payment_value FROM orders JOIN payments
ON orders.order_id = payments.order_id;

SELECT orders.order_purchase_timestamp,
SUM(payments.payment_value)  FROM orders JOIN payments
ON orders.order_id = payments.order_id
GROUP BY orders.order_purchase_timestamp;

SELECT YEAR(orders.order_purchase_timestamp) AS years,
ROUND(SUM(payments.payment_value),2)  FROM orders JOIN payments
ON orders.order_id = payments.order_id
GROUP BY years ORDER BY years DESC;

SELECT (products.product_category) AS category,
SUM(payments.payment_value) AS sales FROM products
JOIN order_items
ON products.product_id = order_items.product_id
JOIN payments 
ON payments.order_id = order_items.order_id
GROUP BY category ORDER BY sales DESC;

SELECT category FROM
(SELECT (products.product_category) AS category,
SUM(payments.payment_value) AS sales FROM products
JOIN order_items
ON products.product_id = order_items.product_id
JOIN payments 
ON payments.order_id = order_items.order_id
GROUP BY category ORDER BY sales DESC) AS a LIMIT 1;

WITH a AS(SELECT products.product_category AS category,
SUM(payments.payment_value) AS sales
FROM products JOIN order_items
ON products.product_id = order_items.product_id
JOIN payments
ON payments.order_id = order_items.order_id
GROUP BY category ORDER BY sales DESC)

SELECT CASE
WHEN sales <= 5000 THEN "low"
WHEN sales >= 100000 THEN "high"
ELSE "medium"
END AS sale_type
FROM a;

WITH a AS(SELECT products.product_category AS category,
SUM(payments.payment_value) AS sales
FROM products JOIN order_items
ON products.product_id = order_items.product_id
JOIN payments
ON payments.order_id = order_items.order_id
GROUP BY category ORDER BY sales DESC)

SELECT *, CASE
WHEN sales <= 5000 THEN "low"
WHEN sales >= 100000 THEN "high"
ELSE "medium"
END AS sale_type
FROM a;

SELECT orders.order_purchase_timestamp AS order_date,
payments.payment_value
FROM orders JOIN payments
ON orders.order_id = payments.order_id;

SELECT order_date,sales,
SUM(sales) OVER(ORDER BY order_date) FROM 
(SELECT DATE(orders.order_purchase_timestamp) AS order_date,
SUM(payments.payment_value) AS sales
FROM orders JOIN payments
ON orders.order_id = payments.order_id
GROUP BY order_date) AS a;

WITH a AS(SELECT (products.product_category) AS category,
SUM(payments.payment_value) AS sales FROM products
JOIN order_items
ON products.product_id = order_items.product_id
JOIN payments 
ON payments.order_id = order_items.order_id
GROUP BY category)
SELECT category, sales, rank() OVER (ORDER BY sales)
FROM a; 

WITH a AS(SELECT (products.product_category) AS category,
SUM(payments.payment_value) AS sales FROM products
JOIN order_items
ON products.product_id = order_items.product_id
JOIN payments 
ON payments.order_id = order_items.order_id
GROUP BY category),
b AS (SELECT category, sales, rank() OVER (ORDER BY  sales DESC) AS rk
FROM a)
SELECT category, sales FROM b WHERE rk <= 3;

CREATE VIEW prod_cate_sales AS
SELECT (products.product_category) AS category,
SUM(payments.payment_value) AS sales FROM products
JOIN order_items
ON products.product_id = order_items.product_id
JOIN payments 
ON payments.order_id = order_items.order_id
GROUP BY category;









































































 


























