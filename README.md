# Bookstore-database-group-project
The goal of this project  is to build a relational database that stores information about the bookstore's operations, including books, authors, customers, orders, shipping, and more. We have created a database that efficiently stores all necessary data and allows for quick retrieval and analysis.

The Group Members are: 
1. Bervaline Moruri
2. Abbie Patriciah 
3. Kimberly Wangui


 Bookstore Database Implementation Report
Objective:
To design and implement a MySQL database system for managing bookstore operations, including book listings, customers, orders, and logistics.

Step-by-Step Implementation
Database Creation

A new MySQL database was created to serve as the central repository for all bookstore-related data.

Schema Design & Data Types

The data model was carefully planned, identifying entities such as book, author, customer, order, and others.

Appropriate data types (e.g., INT, VARCHAR, DATETIME) were selected to ensure data integrity, performance, and accuracy.

Table Creation with SQL

SQL CREATE TABLE statements were written for each table in the database.

Relationships such as one-to-many (e.g., customer to orders) and many-to-many (e.g., books to authors) were implemented using foreign keys and junction tables (e.g., book_author).

User Access Control

User roles and permissions were configured using CREATE USER, GRANT, and REVOKE statements.

This ensured secure access to the database, allowing role-based control (e.g., admins, sales, analysts).

Database Testing

Sample data was inserted into the tables.

Queries were executed to test data retrieval, joining of tables, and validation of foreign key constraints.



Expected Outcomes Achieved
Real-World Experience: Gained hands-on experience designing and implementing a relational database using MySQL.

Schema Optimization: Efficient table design with well-structured relationships and appropriate data types.

Security & Access Control: Implemented basic access management to safeguard data.

Data Exploration: Developed and executed queries to extract meaningful insights from the bookstore dataset.

Table Names and Descriptions
1. book-Stores information about each book.
2. author	-Contains a list of all authors.
3. book_author-	Manages the many-to-many relationship between books and authors.
4. book_language-Stores languages that books can be written in.
5. publisher-Stores publisher details.
6. customer-Contains customer profiles.
7. customer_address-Links customers to their multiple addresses.
8. address_status-Tracks whether an address is current or old.
9. address-Stores address details.
10. country-Lists countries associated with addresses.
11. cust_order-Captures order details for each customer.
12. order_line-Tracks books included in each order.
13. shipping_method-Lists delivery options for orders.
14. order_status-Enumerates the possible statuses for an order.
15. order_history-Logs historical changes in order statuses.


Conclusion:
The bookstore database project successfully demonstrates the key concepts of database design, implementation, and data handling in MySQL. It provides a scalable foundation for managing bookstore operations and can be extended to support future needs like inventory tracking or customer analytics.



The ERD Diagram
![ERD Diagram](ERD%20DIAGRAM.png)

This structure ensures data normalization and allows flexibility (e.g., tracking address history).
