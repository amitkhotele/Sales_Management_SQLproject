-- Create Database
CREATE DATABASE SalesManagement;
USE SalesManagement;

-- 1. Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    join_date DATE
);

-- 2. Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

-- 3. Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 4. OrderDetails Table
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


-- Insert Customers
INSERT INTO Customers (customer_name, email, phone, city, join_date)
VALUES
('Amit Khotele', 'amit@gmail.com', '9876543210', 'Nagpur', '2024-01-12'),
('Priya Sharma', 'priya@gmail.com', '9812345678', 'Mumbai', '2024-03-20'),
('Ravi Patel', 'ravi@gmail.com', '9823456789', 'Pune', '2024-02-15');

-- Insert Products
INSERT INTO Products (product_name, category, price, stock)
VALUES
('Laptop', 'Electronics', 55000.00, 20),
('Mobile', 'Electronics', 25000.00, 50),
('Headphones', 'Accessories', 2000.00, 100),
('Office Chair', 'Furniture', 7000.00, 30);

-- Insert Orders
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
(1, '2024-04-10', 57000.00),
(2, '2024-05-15', 32000.00),
(3, '2024-06-01', 27000.00);

-- Insert Order Details
INSERT INTO OrderDetails (order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 55000.00),
(1, 3, 1, 2000.00),
(2, 2, 1, 25000.00),
(2, 3, 2, 4000.00),
(3, 4, 3, 21000.00),
(3, 3, 3, 6000.00);
