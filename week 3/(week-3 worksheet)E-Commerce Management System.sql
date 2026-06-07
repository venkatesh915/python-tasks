-- =========================================================
-- E-COMMERCE MANAGEMENT SYSTEM COMPLETE SQL PROJECT
-- PostgreSQL Full Single File Code
-- =========================================================

-- =========================
-- DATABASE
-- =========================

CREATE DATABASE ecommerce_db;

-- Connect Database
\c ecommerce_db;

-- =========================
-- TABLES
-- =========================

-- CUSTOMERS
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    registration_date DATE
);

-- ADDRESSES
CREATE TABLE addresses (
    address_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    address_type VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10)
);

-- CATEGORIES
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100),
    parent_category_id INT REFERENCES categories(category_id)
);

-- SUPPLIERS
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- PRODUCTS
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    description TEXT,
    price NUMERIC(10,2),
    stock_quantity INT,
    category_id INT REFERENCES categories(category_id),
    supplier_id INT REFERENCES suppliers(supplier_id)
);

-- ORDERS
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    order_status VARCHAR(50),
    total_amount NUMERIC(10,2)
);

-- ORDER ITEMS
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    unit_price NUMERIC(10,2)
);

-- PAYMENTS
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    payment_date DATE,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    amount NUMERIC(10,2)
);

-- SHIPMENTS
CREATE TABLE shipments (
    shipment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    shipment_date DATE,
    delivery_date DATE,
    shipment_status VARCHAR(50)
);

-- REVIEWS
CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    product_id INT REFERENCES products(product_id),
    rating INT,
    review_text TEXT
);

-- WISHLIST
CREATE TABLE wishlist (
    wishlist_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    product_id INT REFERENCES products(product_id)
);

-- CART
CREATE TABLE cart (
    cart_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id)
);

-- CART ITEMS
CREATE TABLE cart_items (
    cart_item_id SERIAL PRIMARY KEY,
    cart_id INT REFERENCES cart(cart_id),
    product_id INT REFERENCES products(product_id),
    quantity INT
);

-- EMPLOYEES
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100),
    manager_id INT REFERENCES employees(employee_id),
    salary NUMERIC(10,2),
    designation VARCHAR(50)
);

-- =========================
-- SAMPLE DATA
-- =========================

INSERT INTO customers(customer_name,email,phone,registration_date)
VALUES
('Rahul','rahul@gmail.com','9876543210','2026-01-10'),
('Sneha','sneha@gmail.com','9876543211','2026-02-15'),
('Arjun','arjun@gmail.com','9876543212','2026-03-12');

INSERT INTO addresses(customer_id,address_type,city,state,pincode)
VALUES
(1,'Home','Hyderabad','Telangana','500001'),
(2,'Office','Bangalore','Karnataka','560001'),
(3,'Home','Chennai','Tamil Nadu','600001');

INSERT INTO categories(category_name,parent_category_id)
VALUES
('Electronics',NULL),
('Mobiles',1),
('Laptops',1);

INSERT INTO suppliers(supplier_name,email,phone)
VALUES
('ABC Suppliers','abc@gmail.com','9000000001'),
('XYZ Traders','xyz@gmail.com','9000000002');

INSERT INTO products(product_name,description,price,stock_quantity,category_id,supplier_id)
VALUES
('iPhone 15','Apple Mobile',80000,20,2,1),
('Dell XPS','Dell Laptop',120000,10,3,2),
('Samsung S24','Samsung Mobile',70000,15,2,1);

INSERT INTO orders(customer_id,order_date,order_status,total_amount)
VALUES
(1,'2026-06-01','Completed',80000),
(2,'2026-06-02','Pending',120000);

INSERT INTO order_items(order_id,product_id,quantity,unit_price)
VALUES
(1,1,1,80000),
(2,2,1,120000);

INSERT INTO payments(order_id,payment_date,payment_method,payment_status,amount)
VALUES
(1,'2026-06-01','UPI','Paid',80000),
(2,'2026-06-02','Card','Pending',120000);

INSERT INTO shipments(order_id,shipment_date,delivery_date,shipment_status)
VALUES
(1,'2026-06-02','2026-06-05','Delivered'),
(2,'2026-06-03',NULL,'Shipped');

INSERT INTO reviews(customer_id,product_id,rating,review_text)
VALUES
(1,1,5,'Excellent'),
(2,2,4,'Good Laptop');

INSERT INTO wishlist(customer_id,product_id)
VALUES
(1,2),
(2,1);

INSERT INTO cart(customer_id)
VALUES
(1),
(2);

INSERT INTO cart_items(cart_id,product_id,quantity)
VALUES
(1,1,2),
(2,2,1);

INSERT INTO employees(employee_name,manager_id,salary,designation)
VALUES
('Manager',NULL,90000,'Senior Manager'),
('Employee1',1,50000,'Developer'),
('Employee2',1,45000,'Tester');

-- =========================================================
-- BASIC QUERIES
-- =========================================================

-- 1
SELECT * FROM customers;

-- 2
SELECT * FROM products
WHERE price > 5000;

-- 3
SELECT * FROM products
WHERE stock_quantity < 10;

-- 4
SELECT * FROM suppliers;

-- 5
SELECT * FROM orders
WHERE order_status='Completed';

-- 6
SELECT * FROM orders
WHERE DATE_TRUNC('month',order_date)=DATE_TRUNC('month',CURRENT_DATE);

-- 7
SELECT * FROM customers
WHERE registration_date >= CURRENT_DATE - INTERVAL '30 days';

-- 8
SELECT * FROM products
ORDER BY price DESC;

-- 9
SELECT * FROM products
ORDER BY price DESC
LIMIT 10;

-- 10
SELECT * FROM shipments
WHERE shipment_status='Shipped';

-- =========================================================
-- AGGREGATE FUNCTIONS
-- =========================================================

-- 11
SELECT COUNT(*) AS total_customers
FROM customers;

-- 12
SELECT COUNT(*) AS total_products
FROM products;

-- 13
SELECT AVG(price) AS average_price
FROM products;

-- 14
SELECT MAX(price) AS highest_price
FROM products;

-- 15
SELECT MIN(price) AS lowest_price
FROM products;

-- 16
SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- 17
SELECT COUNT(*) AS total_orders
FROM orders;

-- 18
SELECT SUM(stock_quantity) AS total_stock
FROM products;

-- 19
SELECT AVG(total_amount) AS average_order_value
FROM orders;

-- 20
SELECT SUM(amount) AS total_payment_received
FROM payments;

-- =========================================================
-- GROUP BY
-- =========================================================

-- 21
SELECT c.category_name,
COUNT(p.product_id)
FROM categories c
JOIN products p
ON c.category_id=p.category_id
GROUP BY c.category_name;

-- 22
SELECT c.category_name,
SUM(oi.quantity*oi.unit_price) AS total_sales
FROM categories c
JOIN products p
ON c.category_id=p.category_id
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY c.category_name;

-- 23
SELECT s.supplier_name,
SUM(oi.quantity*oi.unit_price) AS revenue
FROM suppliers s
JOIN products p
ON s.supplier_id=p.supplier_id
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY s.supplier_name;

-- 24
SELECT city,
COUNT(customer_id)
FROM addresses
GROUP BY city;

-- 25
SELECT order_status,
COUNT(order_id)
FROM orders
GROUP BY order_status;

-- 26
SELECT p.product_name,
AVG(r.rating)
FROM products p
JOIN reviews r
ON p.product_id=r.product_id
GROUP BY p.product_name;

-- 27
SELECT s.supplier_name,
COUNT(p.product_id)
FROM suppliers s
JOIN products p
ON s.supplier_id=p.supplier_id
GROUP BY s.supplier_name;

-- 28
SELECT shipment_status,
COUNT(shipment_id)
FROM shipments
GROUP BY shipment_status;

-- 29
SELECT payment_method,
SUM(amount)
FROM payments
GROUP BY payment_method;

-- 30
SELECT DATE_TRUNC('month',order_date) AS month,
SUM(total_amount)
FROM orders
GROUP BY month;

-- =========================================================
-- HAVING
-- =========================================================

-- 31
SELECT c.category_name,
COUNT(p.product_id)
FROM categories c
JOIN products p
ON c.category_id=p.category_id
GROUP BY c.category_name
HAVING COUNT(p.product_id) > 20;

-- 32
SELECT s.supplier_name,
COUNT(p.product_id)
FROM suppliers s
JOIN products p
ON s.supplier_id=p.supplier_id
GROUP BY s.supplier_name
HAVING COUNT(p.product_id) > 10;

-- 33
SELECT c.customer_name,
COUNT(o.order_id)
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 5;

-- 34
SELECT p.product_name,
AVG(r.rating)
FROM products p
JOIN reviews r
ON p.product_id=r.product_id
GROUP BY p.product_name
HAVING AVG(r.rating) > 4;

-- 35
SELECT city,
COUNT(customer_id)
FROM addresses
GROUP BY city
HAVING COUNT(customer_id) > 50;

-- =========================================================
-- INNER JOINS
-- =========================================================

-- 36
SELECT c.customer_name,
o.order_id,
o.total_amount
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id;

-- 37
SELECT o.order_id,
p.product_name,
oi.quantity
FROM orders o
JOIN order_items oi
ON o.order_id=oi.order_id
JOIN products p
ON oi.product_id=p.product_id;

-- 38
SELECT p.product_name,
c.category_name
FROM products p
JOIN categories c
ON p.category_id=c.category_id;

-- 39
SELECT p.product_name,
s.supplier_name
FROM products p
JOIN suppliers s
ON p.supplier_id=s.supplier_id;

-- 40
SELECT c.customer_name,
p.product_name,
r.rating
FROM reviews r
JOIN customers c
ON r.customer_id=c.customer_id
JOIN products p
ON r.product_id=p.product_id;

-- =========================================================
-- LEFT JOINS
-- =========================================================

-- 46
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id=o.customer_id
WHERE o.order_id IS NULL;

-- 47
SELECT p.product_name
FROM products p
LEFT JOIN order_items oi
ON p.product_id=oi.product_id
WHERE oi.order_item_id IS NULL;

-- 48
SELECT p.product_name
FROM products p
LEFT JOIN reviews r
ON p.product_id=r.product_id
WHERE r.review_id IS NULL;

-- =========================================================
-- SUBQUERIES
-- =========================================================

-- 56
SELECT product_name
FROM products
WHERE product_id=(
    SELECT product_id
    FROM order_items
    GROUP BY product_id
    ORDER BY SUM(quantity) DESC
    LIMIT 1
);

-- 57
SELECT product_name
FROM products
WHERE product_id=(
    SELECT product_id
    FROM order_items
    GROUP BY product_id
    ORDER BY SUM(quantity) DESC
    OFFSET 1 LIMIT 1
);

-- =========================================================
-- WINDOW FUNCTIONS
-- =========================================================

-- 71
SELECT p.product_name,
SUM(oi.quantity*oi.unit_price) AS revenue,
RANK() OVER(
ORDER BY SUM(oi.quantity*oi.unit_price) DESC
) AS rank
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY p.product_name;

-- 72
SELECT c.customer_name,
SUM(o.total_amount) AS spending,
RANK() OVER(
ORDER BY SUM(o.total_amount) DESC
) AS rank
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name;

-- =========================================================
-- CTE
-- =========================================================

-- 81
WITH revenue_cte AS (
    SELECT c.category_name,
    SUM(oi.quantity*oi.unit_price) AS revenue
    FROM categories c
    JOIN products p
    ON c.category_id=p.category_id
    JOIN order_items oi
    ON p.product_id=oi.product_id
    GROUP BY c.category_name
)

SELECT * FROM revenue_cte;

-- =========================================================
-- RECURSIVE CTE
-- =========================================================

-- 86
WITH RECURSIVE category_tree AS (

    SELECT
    category_id,
    category_name,
    parent_category_id,
    1 AS level

    FROM categories
    WHERE parent_category_id IS NULL

    UNION ALL

    SELECT
    c.category_id,
    c.category_name,
    c.parent_category_id,
    ct.level + 1

    FROM categories c
    JOIN category_tree ct
    ON c.parent_category_id=ct.category_id
)

SELECT * FROM category_tree;

-- 88
WITH RECURSIVE employee_hierarchy AS (

    SELECT
    employee_id,
    employee_name,
    manager_id,
    designation

    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
    e.employee_id,
    e.employee_name,
    e.manager_id,
    e.designation

    FROM employees e
    JOIN employee_hierarchy eh
    ON e.manager_id=eh.employee_id
)

SELECT * FROM employee_hierarchy;

-- =========================================================
-- TRANSACTIONS
-- =========================================================

BEGIN;

INSERT INTO orders(customer_id,order_date,order_status,total_amount)
VALUES
(1,CURRENT_DATE,'Pending',50000);

INSERT INTO payments(order_id,payment_date,payment_method,payment_status,amount)
VALUES
(currval('orders_order_id_seq'),
CURRENT_DATE,
'UPI',
'Paid',
50000);

COMMIT;

-- =========================================================
-- SAVEPOINT
-- =========================================================

BEGIN;

SAVEPOINT before_payment;

INSERT INTO payments(order_id,payment_date,payment_method,payment_status,amount)
VALUES
(1,CURRENT_DATE,'Card','Paid',10000);

ROLLBACK TO before_payment;

COMMIT;

-- =========================================================
-- INDEXES
-- =========================================================

CREATE INDEX idx_product_name
ON products(product_name);

CREATE INDEX idx_customer_email
ON customers(email);

-- =========================================================
-- EXPLAIN ANALYZE
-- =========================================================

EXPLAIN ANALYZE
SELECT p.product_name,
SUM(oi.quantity)
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY p.product_name;

-- =========================================================
-- MEGA DASHBOARD QUERY
-- =========================================================

WITH sales_dashboard AS (

    SELECT
    p.product_name,
    c.category_name,
    SUM(oi.quantity) AS total_quantity,
    SUM(oi.quantity*oi.unit_price) AS revenue

    FROM products p
    JOIN categories c
    ON p.category_id=c.category_id
    JOIN order_items oi
    ON p.product_id=oi.product_id

    GROUP BY p.product_name,c.category_name
)

SELECT *,
RANK() OVER(
ORDER BY revenue DESC
) AS revenue_rank

FROM sales_dashboard;

-- =========================================================
-- END OF PROJECT
-- =========================================================