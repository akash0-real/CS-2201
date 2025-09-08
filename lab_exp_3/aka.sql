
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: akash bisht
-- USN: 1RUA24BCA0006
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
/*
# USER(), Host_Name, MySQL_Version, Current_Date_Time
'root@localhost', 'DESKTOP-DP988V4', '8.4.6', '2025-09-08 11:29:41'
*/
create database job;
use job;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 
create table employee(
empid varchar(50) primary key,
firs_name varchar(50),
last_name varchar(50),
salary int,
birthdate date,
hire_date date
);

-- 2. Insert 10 records to employee;
insert into employee values
('e1','akash','bisht',1000000,'2006-08-14','2025-07-01'),
('e2','jon','pork',10000,'1995-02-04' ,'2025-08-01'),
('e3','sarah','johnson',40000,'2006-10-14' ,'2025-02-01'),
('e4','max','verstppan',1230000,'1990-03-4' ,'2025-06-01'),
('e5','charles','lecrec',8000000,'1902-02-02' ,'2025-08-01'),
('e6','lewis','hami',344000000,'1985-09-10' ,'2025-05-01'),
('e7','carlos','sainz',45000000,'1980-06-01' ,'2025-01-01'),
('e8','lando','norris',400,'2000-08-14' ,'2025-02-01'),
('e9','alex','bisht',900000000,'2006-08-26' ,'2025-03-01'),
('e10','oscar','pastry',300000,'2000-05-10' ,'2025-04-01');

-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  
create table orders
(order_id varchar(50) primary key,
emp_id varchar(40),
order_date date,
total_amount int,
foreign key(emp_id) references employee(empid)
);

-- 4. Insert 10 records to Orders
insert into orders values
(1,'e1','2025-09-02',123000),
(2,'e2','2025-04-02',123000),
(3,'e3','2025-06-02',4000),
(4,'e4','2025-08-02',21000),
(5,'e5','2025-09-01',23000),
(6,'e6','2025-02-12',2000),
(7,'e7','2025-01-15',32000),
(8,'e8','2025-05-22',122000),
(9,'e9','2025-02-18',100),
(10,'e10','2025-09-06',1000);

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
select * from employee;

select * from orders;

-- Output: 
/*
# empid, firs_name, last_name, salary, birthdate, hire_date
'e1', 'akash', 'bisht', '1000000', '2006-08-14', '2025-07-01'
'e10', 'oscar', 'pastry', '300000', '2000-05-10', '2025-04-01'
'e2', 'jon', 'pork', '10000', '1995-02-04', '2025-08-01'
'e3', 'sarah', 'johnson', '40000', '2006-10-14', '2025-02-01'
'e4', 'max', 'verstppan', '1230000', '1990-03-04', '2025-06-01'
'e5', 'charles', 'lecrec', '8000000', '1902-02-02', '2025-08-01'
'e6', 'lewis', 'hami', '344000000', '1985-09-10', '2025-05-01'
'e7', 'carlos', 'sainz', '45000000', '1980-06-01', '2025-01-01'
'e8', 'lando', 'norris', '400', '2000-08-14', '2025-02-01'
'e9', 'alex', 'bisht', '900000000', '2006-08-26', '2025-03-01'
*/
/*
# order_id, emp_id, order_date, total_amount
'1', 'e1', '2025-09-02', '123000'
'10', 'e10', '2025-09-06', '1000'
'2', 'e2', '2025-04-02', '123000'
'3', 'e3', '2025-06-02', '4000'
'4', 'e4', '2025-08-02', '21000'
'5', 'e5', '2025-09-01', '23000'
'6', 'e6', '2025-02-12', '2000'
'7', 'e7', '2025-01-15', '32000'
'8', 'e8', '2025-05-22', '122000'
'9', 'e9', '2025-02-18', '100'	
*/


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
select round(salary) from employee;

-- Output: 
/*
# round(salary)
'1000000'
'300000'
'10000'
'40000'
'1230000'
'8000000'
'344000000'
'45000000'
'400'
'900000000'

*/

/* b. Absolute Values: Show absolute values of salaries */
select abs(salary) from employee;

-- Output: 
/* 
# abs(salary)
'1000000'
'300000'
'10000'
'40000'
'1230000'
'8000000'
'344000000'
'45000000'
'400'
'900000000'
*/

/* c. Ceiling Values: Get ceiling values of order amounts */
select ceil(salary) from employee;
-- Output: 
/*
# ceil(salary)
'1000000'
'300000'
'10000'
'40000'
'1230000'
'8000000'
'344000000'
'45000000'
'400'
'900000000'
*/

-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
select count(*) from employee;
-- Output: 

/* b. Sum of Salaries: Calculate total salary expense */

-- Output: 
/*
# count(*)
'10'
*/

/* c. Average Order Amount: Find average order value */
select avg(total_amount) from orders;

-- Output: 

/* d. Max/Min Salary: Find highest and lowest salaries */

-- Output: 
-- avg(total_amount)
-- '45110.0000'

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
select upper(firs_name),lower(firs_name) from employee;
-- Output: 
/*
# upper(firs_name), lower(firs_name)
'AKASH', 'akash'
'OSCAR', 'oscar'
'JON', 'jon'
'SARAH', 'sarah'
'MAX', 'max'
'CHARLES', 'charles'
'LEWIS', 'lewis'
'CARLOS', 'carlos'
'LANDO', 'lando'
'ALEX', 'alex'
*/

/* b. Concatenate Names: Create full names */
select concat(firs_name, last_name) from employee;
-- Output: 
/*
# concat(firs_name, last_name)
'akashbisht'
'oscarpastry'
'jonpork'
'sarahjohnson'
'maxverstppan'
'charleslecrec'
'lewishami'
'carlossainz'
'landonorris'
'alexbisht'
*/

/* c. Extract Substring: Get first 3 characters of first names */
select * from employee where firs_name like 'aka%';

-- Output: 
/*
# empid, firs_name, last_name, salary, birthdate, hire_date
'e1', 'akash', 'bisht', '1000000', '2006-08-14', '2025-07-01'
*/

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */
select convert('2025-09-08', date);

-- Output: 
/*
# CONVERT('2025-09-08', DATE)
'2025-09-08'
*/
-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
select now();

-- Output: 
/*
# now()
'2025-09-08 12:15:22'
*/

/* b. Extract Year: Get year from order dates */
select year(order_date) from orders;

-- Output: 
/*
# year(order_date)
2025
2025
2025
2025
2025
2025
2025
2025
2025
2025
*/
/* c. Add Months: Add 3 months to order dates */
select date_add(order_date, interval 3 month) from orders; 
-- Output: 
/*
# date_add(order_date, interval 3 month)
'2025-12-02'
'2025-12-06'
'2025-07-02'
'2025-09-02'
'2025-11-02'
'2025-12-01'
'2025-05-12'
'2025-04-15'
'2025-08-22'
'2025-05-18'
*/
/* d. Days Since Order: Calculate days between order date and now */
select datediff(now(), order_date) from orders;
-- Output: 
/*
# datediff(now(), order_date)
'6'
'2'
'159'
'98'
'37'
'7'
'208'
'236'
'109'
'202'
*/

-- END of the Task -- 
