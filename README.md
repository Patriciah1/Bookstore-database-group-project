# Bookstore-database-group-project
The goal of this project  is to build a relational database that stores information about the bookstore's operations, including books, authors, customers, orders, shipping, and more. We have created a database that efficiently stores all necessary data and allows for quick retrieval and analysis.

The Group Members are: 
1. Bervaline Moruri
2. Abbie Patriciah 
3. Kimberly Wangui



Customer & Address Management
Main Responsibilities: Tables involving customer profiles and addresses

Tables to Create:                     
1. customer-Stores customer information
2. customer_address-Links customers to addresses (many-to-many)
3. address_status-Defines if the address is current, old, etc.
4. address-Stores the actual address details
5. country-List of countries for addresses

Summary of Relationships:
i) customer links to customer_address.
ii) customer_address links to address and address_status.
iii) address links to country.

The ERD Diagram
![ERD Diagram](ERD DIAGRAM.png)

This structure ensures data normalization and allows flexibility (e.g., tracking address history).
