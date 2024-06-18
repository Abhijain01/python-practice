SELECT CHAR_LENGTH('Hello, World!');

SELECT ASCII('A');
SELECT ASCII('abc');

SELECT CONCAT('Hello', ' ', 'World');

SELECT INSTR('Hello, World!', 'o');
SELECT INSTR('Hello, World!', 'x');

SELECT LCASE('HELLO');
SELECT LOWER('SupPorT'); 

SELECT UCASE('hello');
SELECT UPPER('SupPorT');

SELECT SUBSTR('Hello, World!', 8, 5);
SELECT SUBSTR('Hello, World!', 1, 5);

SELECT LPAD('Hello', 10, '*');

SELECT RPAD('Hello', 10, '*');

SELECT TRIM('   Hello, World!   ');
SELECT RTRIM('   Hello, World!   ');
SELECT LTRIM('   Hello, World!   ');


SELECT CURRENT_DATE() AS today;

SELECT DATEDIFF('2023-05-10', '2023-05-01') AS day_difference;

SELECT DATE('2023-05-01 12:34:56') AS result;

SELECT CURRENT_TIME() AS now;

SELECT LAST_DAY('2023-05-01') AS last_day_of_may;

SELECT SYSDATE() AS `Timestamp`;

SELECT ADDDATE('2023-05-01', INTERVAL 7 DAY) AS one_week_later;

# Numeric Functions

SELECT AVG(price) AS avg_price
FROM products;

SELECT COUNT(*) AS total_products
FROM products;

SELECT POW(2, 3) AS result;

SELECT MIN(price) AS min_price
FROM products;

SELECT MAX(stock) AS max_stock, location
FROM products
GROUP BY location;

SELECT ROUND(3.1416, 2) AS result;
SELECT ROUND(3.1416) AS result; 

SELECT SQRT(25) AS result;

SELECT FLOOR(3.8) AS result;
SELECT FLOOR(-3.8) AS result;