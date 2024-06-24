create database online_store;
use online_store;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(200)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT DEFAULT 0
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

BEGIN;

INSERT INTO Customers (customer_id, name, email, address) VALUES
(1, 'John Doe', 'johndoe@example.com', '123 Main St'),
(2, 'Jane Smith', 'janesmith@example.com', '456 Elm St'),
(3, 'Bob Johnson', 'bobjohnson@example.com', '789 Oak St');

INSERT INTO Products (product_id, product_name, price, stock_quantity) VALUES
(101, 'Apple iPhone', 999.99, 10),
(102, 'Samsung TV', 1299.99, 5),
(103, 'Nike Shoes', 79.99, 20);

COMMIT;

DELIMITER //
CREATE TRIGGER UpdateStockQuantity
AFTER INSERT ON OrderItems
FOR EACH ROW
BEGIN
    DECLARE new_stock_quantity INT;
    SELECT stock_quantity - NEW.quantity INTO new_stock_quantity FROM Products WHERE product_id = NEW.product_id;
    UPDATE Products SET stock_quantity = new_stock_quantity WHERE product_id = NEW.product_id;
END //
DELIMITER ;


INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 1, '2024-01-15', 1999.98);

INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity) VALUES
(1, 1, 101, 2);

SELECT * FROM Products;

CREATE VIEW CustomerOrderView AS
SELECT C.name AS customer_name, C.email, O.order_date, P.product_name, OI.quantity
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id
JOIN OrderItems OI ON O.order_id = OI.order_id
JOIN Products P ON OI.product_id = P.product_id;


SELECT * FROM CustomerOrderView;