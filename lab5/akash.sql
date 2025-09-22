-- Lab Experiment 05: To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: AKash singh bisht
-- USN: 1RUA24BCA0006
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Write your code below this line along with the output 

/*
# USER(), Host_Name, MySQL_Version, Current_Date_Time
'root@localhost', 'DESKTOP-2A5AI7U', '9.4.0', '2025-09-22 11:30:20'
*/
create database bussiness;
use bussiness;

-- table 01: Customers
-- CREATE  a TABLE named Customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(50),city VARCHAR(50)
create table customers(
	customer_id varchar(50) primary key,
    name varchar(50),
    city varchar(50)
);

-- insert 5 records
insert into customers values('c1','akash','banglore'),
('c2', 'max','zanvoort'),
('c3', 'charles','monte-carlo'),
('c4', 'sainz','barcelona'),
('c5', 'lewis','london');
select * from customers;

/*
# customer_id, name, city
'c1', 'akash', 'banglore'
'c2', 'max', 'zanvoort'
'c3', 'charles', 'monte-carlo'
'c4', 'sainz', 'barcelona'
'c5', 'lewis', 'london'
*/

-- TABLE:02 Orders Table

-- CREATE a TABLE named Orders (order_id INT PRIMARY KEY,customer_id INT foreign key,product_name VARCHAR(50),order_date DATE,

create table orders (
	order_id varchar(50) primary key,
    customer_id varchar(50),
    foreign key(customer_id) references customers(customer_id),
    product_name varchar(40),
    order_date date
);
    -- insert 5 records
    
insert into orders values 
    ('o1', 'c1', 'Laptop', '2025-09-01'),
    ('o2', 'c2', 'Smartphone', '2025-09-05'),
    ('o3', 'c3', 'Watch', '2025-09-10'),
    ('o4', 'c4', 'Headphones', '2025-09-12'),
    ('o5', 'c5', 'Tablet', '2025-09-15');    
    
select * from orders;
/*
# order_id, customer_id, product_name, order_date
'o1', 'c1', 'Laptop', '2025-09-01'
'o2', 'c2', 'Smartphone', '2025-09-05'
'o3', 'c3', 'Watch', '2025-09-10'
'o4', 'c4', 'Headphones', '2025-09-12'
'o5', 'c5', 'Tablet', '2025-09-15'
*/

-- TASK FOR STUDENTS 

 
-- Write and Execute Queries
/*
1. Inner Join – 
   Find all orders placed by customers from the city "Bangalore."
   List all customers with the products they ordered.
   Show customer names and their order dates.
   Display order IDs with the corresponding customer names.
   Find the number of orders placed by each customer.
   Show city names along with the products ordered by customers.
*/
SELECT o.order_id, c.name AS customer_name, o.product_name, o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE c.city = 'banglore';

/*
# order_id, customer_name, product_name, order_date
'o1', 'akash', 'Laptop', '2025-09-01'
*/

SELECT c.name AS customer_name, o.product_name
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;
/*
# customer_name, product_name
'akash', 'Laptop'
'max', 'Smartphone'
'charles', 'Watch'
'sainz', 'Headphones'
'lewis', 'Tablet'
*/

SELECT c.name AS customer_name, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

/*
# customer_name, order_date
'akash', '2025-09-01'
'max', '2025-09-05'
'charles', '2025-09-10'
'sainz', '2025-09-12'
'lewis', '2025-09-15'
*/

SELECT o.order_id, c.name AS customer_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;
/*
# order_id, customer_name
'o1', 'akash'
'o2', 'max'
'o3', 'charles'
'o4', 'sainz'
'o5', 'lewis'
*/

SELECT c.name AS customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

/*
# customer_name, total_orders
'akash', '1'
'max', '1'
'charles', '1'
'sainz', '1'
'lewis', '1'
*/
SELECT c.city, o.product_name
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;


/*
# city, product_name
'banglore', 'Laptop'
'zanvoort', 'Smartphone'
'monte-carlo', 'Watch'
'barcelona', 'Headphones'
'london', 'Tablet'
*/




/* 
2  Left Outer Join – 
    Find all customers and their orders, even if a customer has no orders.
    List all customers and the products they ordered.
    Show customer IDs, names, and their order IDs.
    Find the total number of orders (if any) placed by each customer.
    Retrieve customers who have not placed any orders.
	Display customer names with their order dates.
-- Write your code below this line along with the output 
*/
SELECT c.customer_id, c.name AS customer_name, o.order_id, o.product_name, o.order_date
FROM customers c
LEFT OUTER JOIN orders o ON c.customer_id = o.customer_id;
/*
# customer_id, customer_name, order_id, product_name, order_date
'c1', 'akash', 'o1', 'Laptop', '2025-09-01'
'c2', 'max', 'o2', 'Smartphone', '2025-09-05'
'c3', 'charles', 'o3', 'Watch', '2025-09-10'
'c4', 'sainz', 'o4', 'Headphones', '2025-09-12'
'c5', 'lewis', 'o5', 'Tablet', '2025-09-15'
*/

SELECT c.name AS customer_name, o.product_name
FROM customers c
LEFT OUTER JOIN orders o ON c.customer_id = o.customer_id;

/*
 # customer_name, product_name
'akash', 'Laptop'
'max', 'Smartphone'
'charles', 'Watch'
'sainz', 'Headphones'
'lewis', 'Tablet'
*/

SELECT c.customer_id, c.name AS customer_name, o.order_id
FROM customers c
LEFT OUTER JOIN orders o ON c.customer_id = o.customer_id;

/*
# customer_id, customer_name, order_id
'c1', 'akash', 'o1'
'c2', 'max', 'o2'
'c3', 'charles', 'o3'
'c4', 'sainz', 'o4'
'c5', 'lewis', 'o5'
*/

SELECT c.name AS customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT OUTER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

/*
# customer_name, total_orders
'akash', '1'
'max', '1'
'charles', '1'
'sainz', '1'
'lewis', '1'
*/

SELECT c.customer_id, c.name AS customer_name
FROM customers c
LEFT OUTER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

/*
customer_name
*/

SELECT c.name AS customer_name, o.order_date
FROM customers c
LEFT OUTER JOIN orders o ON c.customer_id = o.customer_id;

/*
# customer_name, order_date
'akash', '2025-09-01'
'max', '2025-09-05'
'charles', '2025-09-10'
'sainz', '2025-09-12'
'lewis', '2025-09-15'
*/
	



/* 3: Right Outer Join – 
      Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it.
      Show all orders with the customer names.
      Display product names with the customers who ordered them.
	  List order IDs with customer cities.
      Find the number of orders per customer (include those without orders).
	  Retrieve customers who do not have any matching orders.
     Write your code below this line along with the output 
 */
 
 SELECT o.order_id, o.product_name, o.order_date, c.customer_id, c.name AS customer_name, c.city
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id;

 /*
 # order_id, product_name, order_date, customer_id, customer_name, city
'o1', 'Laptop', '2025-09-01', 'c1', 'akash', 'banglore'
'o2', 'Smartphone', '2025-09-05', 'c2', 'max', 'zanvoort'
'o3', 'Watch', '2025-09-10', 'c3', 'charles', 'monte-carlo'
'o4', 'Headphones', '2025-09-12', 'c4', 'sainz', 'barcelona'
'o5', 'Tablet', '2025-09-15', 'c5', 'lewis', 'london'
*/

SELECT o.order_id, c.name AS customer_name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id;

/*
# order_id, customer_name
'o1', 'akash'
'o2', 'max'
'o3', 'charles'
'o4', 'sainz'
'o5', 'lewis'
*/

SELECT o.product_name, c.name AS customer_name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id;

/*
# product_name, customer_name
'Laptop', 'akash'
'Smartphone', 'max'
'Watch', 'charles'
'Headphones', 'sainz'
'Tablet', 'lewis'
*/

SELECT o.order_id, c.city
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id;

 /*
 # order_id, city
'o1', 'banglore'
'o2', 'zanvoort'
'o3', 'monte-carlo'
'o4', 'barcelona'
'o5', 'london'
*/
 
SELECT c.customer_id, c.name AS customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;
 
 /*
 # customer_id, customer_name, total_orders
'c1', 'akash', '1'
'c2', 'max', '1'
'c3', 'charles', '1'
'c4', 'sainz', '1'
'c5', 'lewis', '1'
*/

SELECT c.customer_id, c.name AS customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

/*
customer_id, customer_name
*/
 

/* 4: Full Outer Join – 
        Find all customers and their orders, including those customers with no orders and orders without a customer.
        List all customers and products, whether they placed an order or not.
        Show customer IDs with order IDs (include unmatched ones).
		Display customer names with order dates.
		Find all unmatched records (customers without orders and orders without customers).
        Show customer cities with products.
     Write your code below this line along with the output 
  */   
  
SELECT c.customer_id, c.name AS customer_name, o.order_id, o.product_name, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id, c.name AS customer_name, o.order_id, o.product_name, o.order_date
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

/*
# customer_id, customer_name, order_id, product_name, order_date
'c1', 'akash', 'o1', 'Laptop', '2025-09-01'
'c2', 'max', 'o2', 'Smartphone', '2025-09-05'
'c3', 'charles', 'o3', 'Watch', '2025-09-10'
'c4', 'sainz', 'o4', 'Headphones', '2025-09-12'
'c5', 'lewis', 'o5', 'Tablet', '2025-09-15'
*/

SELECT c.name AS customer_name, o.product_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.name AS customer_name, o.product_name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

/*
# customer_name, product_name
'akash', 'Laptop'
'max', 'Smartphone'
'charles', 'Watch'
'sainz', 'Headphones'
'lewis', 'Tablet'
*/

SELECT c.customer_id, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id, o.order_id
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

/*
# customer_id, order_id
'c1', 'o1'
'c2', 'o2'
'c3', 'o3'
'c4', 'o4'
'c5', 'o5'
*/

SELECT c.name AS customer_name, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.name AS customer_name, o.order_date
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

/*
# customer_name, order_date
'akash', '2025-09-01'
'max', '2025-09-05'
'charles', '2025-09-10'
'sainz', '2025-09-12'
'lewis', '2025-09-15'
*/

SELECT c.customer_id, c.name AS customer_name, NULL AS order_id, NULL AS product_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL

UNION

SELECT NULL AS customer_id, NULL AS customer_name, o.order_id, o.product_name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

/*
customer_id, customer_name, order_id, product_name
*/

SELECT c.city, o.product_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT c.city, o.product_name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

/*
# city, product_name
'banglore', 'Laptop'
'zanvoort', 'Smartphone'
'monte-carlo', 'Watch'
'barcelona', 'Headphones'
'london', 'Tablet'
*/
  
  
  
  
  /* 5: Natural Join – 
          Find all orders placed by customers.
          List all customers with the products they ordered using NATURAL JOIN.
          Show customer names along with their order dates using NATURAL JOIN.
          Find all customer cities and the products ordered by those customers using NATURAL JOIN.

     Write your code below this line along with the output 
  */
  SELECT *
FROM customers
NATURAL JOIN orders;

/*
# customer_id, name, city, order_id, product_name, order_date
'c1', 'akash', 'banglore', 'o1', 'Laptop', '2025-09-01'
'c2', 'max', 'zanvoort', 'o2', 'Smartphone', '2025-09-05'
'c3', 'charles', 'monte-carlo', 'o3', 'Watch', '2025-09-10'
'c4', 'sainz', 'barcelona', 'o4', 'Headphones', '2025-09-12'
'c5', 'lewis', 'london', 'o5', 'Tablet', '2025-09-15'
*/

SELECT name AS customer_name, product_name
FROM customers
NATURAL JOIN orders;

/*
# customer_name, product_name
'akash', 'Laptop'
'max', 'Smartphone'
'charles', 'Watch'
'sainz', 'Headphones'
'lewis', 'Tablet'
*/

SELECT name AS customer_name, order_date
FROM customers
NATURAL JOIN orders;

/*
# customer_name, order_date
'akash', '2025-09-01'
'max', '2025-09-05'
'charles', '2025-09-10'
'sainz', '2025-09-12'
'lewis', '2025-09-15'
*/

SELECT city, product_name
FROM customers
NATURAL JOIN orders;

/*
# city, product_name
'banglore', 'Laptop'
'zanvoort', 'Smartphone'
'monte-carlo', 'Watch'
'barcelona', 'Headphones'
'london', 'Tablet'
*/
  
  
  
  
  -- END OF THE EXPERIMENT
