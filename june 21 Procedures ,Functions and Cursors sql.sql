use amazon;

-- DELIMITER COMMAND
DELIMITER $$
CREATE PROCEDURE get_customers()
BEGIN
SELECT * FROM customer;
END $$
DELIMITER ;


-- PROCEDURES
DELIMITER // 
CREATE PROCEDURE select_all_products()
BEGIN
SELECT * FROM products;
END //
DELIMITER ;

-- CALLING PROCEDURE
CALL select_all_products();

-- DROPPING PROCEDURES
DROP PROCEDURE select_all_products;

-- FUNCTIONS
DELIMITER $$
CREATE FUNCTION get_total_revenue()
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE total_revenue INT;
SELECT SUM(p.amount) INTO total_revenue
FROM payment p
INNER JOIN orders o ON p.oid = o.oid
WHERE p.status = 'completed';
RETURN total_revenue;
END $$
DELIMITER ;

-- FUNCTION EXECUTION
SELECT get_total_revenue();

-- DROPPING FUNCTION
DROP FUNCTION IF EXISTS get_total_revenue;

-- IN
DELIMITER // 
CREATE PROCEDURE get_products_details(IN products_id INT)
BEGIN
SELECT * FROM products WHERE pid = products_id;
END // 

-- CALLING PROCEDURE
CALL get_products_details(1);

-- OUT
DELIMITER // 
CREATE PROCEDURE get_product_count(OUT product_count INT)
BEGIN
SELECT COUNT(*) INTO product_count FROM products;
END // 

-- CALLING PROCEDURE
CALL get_product_count(@product_count);
SELECT @product_count as product_count;

-- CURSOR
DELIMITER //
DECLARE @customer_count INT;
SELECT @customer_count = COUNT(*)
FROM customer;
PRINT 'Number of customers: ' + CAST(@customer_count AS VARCHAR(10));
DELIMITER ;

-- PREDEFINED CURSOR
DELIMITER //
DECLARE @total_price INT;
SELECT @total_price = SUM(price)
FROM products
WHERE pname = 'HP Laptop';
PRINT 'Total price of all HP Laptops: ' + CAST(@total_price AS VARCHAR(20));
DELIMITER ;