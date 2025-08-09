-- Create tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);



INSERT INTO customers VALUES
(1, 'Alice Johnson', 'alice@example.com', 'USA'),
(2, 'Bob Smith', 'bob@example.com', 'UK'),
(3, 'Charlie Brown', 'charlie@example.com', 'Canada');

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 800.00),
(2, 'Phone', 'Electronics', 500.00),
(3, 'Shoes', 'Fashion', 60.00);

INSERT INTO orders VALUES
(1, 1, '2025-08-01', 1300.00),
(2, 2, '2025-08-03', 500.00),
(3, 3, '2025-08-05', 60.00);

INSERT INTO order_items VALUES
(1, 1, 1, 1),  -- 1 Laptop
(2, 1, 2, 1),  -- 1 Phone
(3, 2, 2, 1),  -- 1 Phone
(4, 3, 3, 1);  -- 1 Shoes

SELECT name, country
FROM customers
WHERE country = 'USA'
ORDER BY name ASC;


SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country;


SELECT o.order_id, c.name, o.total_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT product_name, price
FROM products
WHERE price > (
    SELECT AVG(price) FROM products
);

SELECT p.category, SUM(oi.quantity * p.price) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category;

CREATE VIEW customer_order_summary AS
SELECT c.name, COUNT(o.order_id) AS total_orders, SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;


CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_products_category ON products(category);

SELECT product_name, price FROM products WHERE price > (SELECT AVG(price) FROM products);




