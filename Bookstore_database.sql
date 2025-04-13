create database Bookstore;

Use bookstore;

CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL UNIQUE
);

-- Insert data
INSERT INTO book_language (language_name) VALUES
('English'),
('French'),
('Spanish'),
('German'),
('Chinese');

SELECT *FROM book_language;

CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

-- -- Insert data
INSERT INTO author (first_name, last_name) VALUES
('George', 'Orwell'),
('Jane', 'Austen'),
('Mark', 'Twain'),
('J.K.', 'Rowling');

SELECT *FROM author;

CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year YEAR,
    price DECIMAL(10, 2),
    language_id INT,
    publisher_id INT,
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);


INSERT INTO book (title, publication_year, price, language_id) VALUES

('Pride and Prejudice', 1913, 12.50, 1, 1),
('Adventures of Huckleberry Finn', 1984, 8.75, 2, 2),
('Harry Potter and the Sorcerer''s Stone', 1997, 15.00, 3, 3);

SELECT * FROM book;


CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Insert data
INSERT INTO book_author (book_id, author_id) VALUES
(13, 1),  
(14, 2),  
(15, 3);  

SELECT *FROM book_author;


CREATE ROLE account@localhost;

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20)
);

-- Insert data
INSERT INTO customer (first_name, last_name, email, phone_number) VALUES
('John', 'Doe', 'john.doe@example.com', '+254712345678'),
('Jane', 'Smith', 'jane.smith@example.com', '+254798765432'),
('Alice', 'Johnson', 'alice.j@example.com', '+14155552678'),
('Bob', 'Brown', 'bob.brown@example.com', '+492011234567');

Use bookstore;
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    founded_year YEAR
);

-- Insert data
INSERT INTO publisher (publisher_name, country, founded_year) VALUES
('Penguin Random House', 'USA', 1925),
('HarperCollins', 'USA', 1989),
('Macmillan Publishers', 'UK', 1943),
('Simon & Schuster', 'USA', 1924),
('Oxford University Press', 'UK', 1986),
('Hachette Livre', 'France', 1926);






CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) UNIQUE
);
-- Insert data
INSERT INTO country (country_name) VALUES
('Kenya'),
('United States'),
('Germany'),
('Japan');


CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(50),
    postal_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Insert data
INSERT INTO address (street, city, postal_code, country_id) VALUES
('123 Moi Avenue', 'Nairobi', '00100', 1),
('456 Nkrumah Rd', 'Mombasa', '80100', 1),
('789 5th Ave', 'New York', '10001', 2),
('123 Hauptstrasse', 'Berlin', '10115', 3),
('12 Shinjuku', 'Tokyo', '160-0022', 4);





CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) UNIQUE
);

-- Insert data

INSERT INTO address_status (status_name) VALUES
('Primary'),
('Billing'),
('Shipping'),
('Previous');


CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- Insert data

-- Format: (customer_id, address_id, status_id)

INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1),  -- John Doe - Primary address
(1, 2, 3),  -- John Doe - Shipping address
(2, 3, 1),  -- Jane Smith - Primary
(3, 4, 2),  -- Alice - Billing
(4, 5, 1);  -- Bob - Primary




CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    shipping_method_id INT,
    order_status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- Insert data
INSERT INTO cust_order (customer_id, shipping_method_id, order_status_id) VALUES
(1, 1, 1), 
(2, 2, 3), 
(1, 3, 2); 


CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Insert data

INSERT INTO order_line (order_id, book_id, quantity, unit_price) VALUES
(1, 13, 1, 9.99),      
(1, 14, 1, 11.99),    
(2, 15, 2, 13.49);     
  




CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100),
    cost DECIMAL(10, 2)
);

-- Sample Data
INSERT INTO shipping_method (method_name, cost) VALUES
('Standard', 5.00),
('Express', 10.00),
('Pickup', 0.00);


CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- Sample Data
INSERT INTO order_status (status_name) VALUES
('Pending'),
('Processing'),
('Shipped'),
('Delivered'),
('Cancelled');


CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    status_id INT,
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(order_status_id)
);

-- Insert data
-- Order 1: Pending -> Processing -> Shipped
INSERT INTO order_history (order_id, status_id, changed_at) VALUES
(1, 1, '2025-04-01 10:00:00'), -- Pending
(1, 2, '2025-04-02 12:00:00'), -- Processing
(1, 3, '2025-04-03 09:30:00'); -- Shipped

-- Order 2: Shipped directly
INSERT INTO order_history (order_id, status_id, changed_at) VALUES
(2, 3, '2025-04-02 11:00:00');

-- Order 3: Pending -> Processing
INSERT INTO order_history (order_id, status_id, changed_at) VALUES
(3, 1, '2025-04-04 08:00:00'),
(3, 2, '2025-04-05 14:45:00');

-- Retrieve book by language
SELECT b.title, l.language_name
FROM book b
JOIN book_language l ON b.language_id = l.language_id
WHERE l.language_name = 'English';

-- all orders for a customer
SELECT o.order_id, o.order_date, s.status_name, sm.method_name
FROM cust_order o
JOIN order_status s ON o.order_status_id = s.order_status_id
JOIN shipping_method sm ON o.shipping_method_id = sm.shipping_method_id
WHERE o.customer_id = 1;  

CREATE ROLE 'admin','customer','staff';

GRANT ALL PRIVILEGES ON bookstore.* TO 'admin';

GRANT SELECT, UPDATE ON bookstore.* TO 'staff';

GRANT SELECT ON bookstore.book TO 'customer_role';
GRANT SELECT ON bookstore.cust_order TO 'customer_role';

-- create user and grant access
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';

GRANT 'admin' to 'admin'@'localhost';

CREATE USER staff@localhost IDENTIFIED BY '1234';
GRANT 'staff' to staff@localhost;

CREATE USER customer@localhost IDENTIFIED BY '456';
GRANT 'customer_role' to customer@localhost;


SELECT user, host FROM mysql.user WHERE user IN ('admin', 'customer', 'staff');


-- Book-author relationships
INSERT INTO book_author (id, author_id, book_id) VALUES
('ba_hp_rowling', 'auth_rowling', 'book_hp1'),
('ba_sh_king', 'auth_king', 'book_shining'),
('ba_hm_atwood', 'auth_atwood', 'book_handmaid');

-- Customers with transaction protection
INSERT INTO customer (id, name, email) VALUES
('cust_john', 'John Smith', 'john.smith@example.com'),
('cust_emma', 'Emma Johnson', 'emma.j@example.com');

-- Addresses with country references
INSERT INTO address (id, street, city, postal_code, country_id) VALUES
('addr_john_home', '123 Main St', 'New York', '10001', 'ctry_us'),
('addr_emma_work', '456 Oxford St', 'London', 'W1D 1BS', 'ctry_uk');

-- Customer-address links
INSERT INTO customer_address (id, customer_id, address_id, status_id) VALUES
('ca_john_home', 'cust_john', 'addr_john_home', 'addrstat_home'),
('ca_emma_work', 'cust_emma', 'addr_emma_work', 'addrstat_work');




