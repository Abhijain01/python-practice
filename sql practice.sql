-- Create database
CREATE DATABASE amazon;

USE amazon;

-- Create tables
CREATE TABLE products (
  pid INT(3) PRIMARY KEY,
  pname VARCHAR(50) NOT NULL,
  price INT(10) NOT NULL,
  stock INT(5),
  location VARCHAR(30) CHECK(location IN ('Mumbai', 'Delhi'))
);

CREATE TABLE customer (
  cid INT(3) PRIMARY KEY,
  cname VARCHAR(30) NOT NULL,
  age INT(3),
  addr VARCHAR(50)
);

CREATE TABLE orders (
  oid INT(3) PRIMARY KEY,
  cid INT(3),
  pid INT(3),
  amt INT(10) NOT NULL,
  FOREIGN KEY(cid) REFERENCES customer(cid),
  FOREIGN KEY(pid) REFERENCES products(pid)
);

CREATE TABLE payment (
  pay_id INT(3) PRIMARY KEY,
  oid INT(3),
  amount INT(10) NOT NULL,
  mode VARCHAR(30) CHECK(mode IN ('upi', 'credit', 'debit')),
  status VARCHAR(30),
  FOREIGN KEY(oid) REFERENCES orders(oid)
);

CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  position VARCHAR(100) NOT NULL,
  salary DECIMAL(10, 2) NOT NULL
);

CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  age INT CHECK (age >= 18),
  course_id INT,
  grade CHAR(1) DEFAULT 'F'
);

CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(100) NOT NULL
);

ALTER TABLE students
ADD CONSTRAINT fk_course
FOREIGN KEY (course_id)
REFERENCES courses (course_id)
ON DELETE CASCADE;

-- Insert data
INSERT INTO products VALUES
  (1, 'HP Laptop', 50000, 15, 'Mumbai'),
  (2, 'Realme Mobile', 20000, 30, 'Delhi'),
  (3, 'Boat earpods', 3000, 50, 'Delhi'),
  (4, 'Levono Laptop', 40000, 15, 'Mumbai'),
  (5, 'Charger', 1000, 0, 'Mumbai'),
  (6, 'Mac Book', 78000, 6, 'Delhi'),
  (7, 'JBL speaker', 6000, 2, 'Delhi');

INSERT INTO customer VALUES
  (101, 'Ravi', 30, 'fdslfjl'),
  (102, 'Rahul', 25, 'fdslfjl'),
  (103, 'Simran', 32, 'fdslfjl'),
  (104, 'Purvesh', 28, 'fdslfjl'),
  (105, 'Sanjana', 22, 'fdslfjl');

INSERT INTO orders VALUES
  (10001, 102, 3, 2700),
  (10002, 104, 2, 18000),
  (10003, 105, 5, 900),
  (10004, 101, 1, 46000);

INSERT INTO payment VALUES
  (1, 10001, 2700, 'upi', 'completed'),
  (2, 10002, 18000, 'credit', 'completed'),
  (3, 10003, 900, 'debit', 'in process');

INSERT INTO employees VALUES
  (1, 'John Doe', 'Software Engineer', 75000);

INSERT INTO students VALUES
  (1, 'Alice Johnson', 'alice@example.com', 21, 101, 'A');

-- Update records
UPDATE products
SET location = 'chennai'
WHERE pname = 'Mac Book';

UPDATE employees
SET salary = 80000
WHERE id = 1;

-- Delete records
DELETE FROM customer
WHERE cname = 'Ravi';

DELETE FROM products
WHERE stock < 100;