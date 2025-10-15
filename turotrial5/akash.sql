create database exaam;
use exaam;
/* 1. CREATE TABLES
Q1. Create two tables named Department and Employee with the following details:
Department:
 dept_id (Primary Key)
 dept_name
 location
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);
 Employee:
emp_id (Primary Key)
 emp_name
age
salary
designation
address
doj (date of joining)
dept_id (Foreign Key referencing Department table)

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    designation VARCHAR(50),
    address VARCHAR(100),
    doj DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
 

2. INSERT DATA
Q2. Insert at least 5 employee records and 4 department records into the respective tables
with realistic values.

INSERT INTO Department (dept_id, dept_name, location) 
values (1, 'Human Resources', 'Delhi'),
(2, 'IT', 'Bangalore'),
(3, 'Finance', 'Mumbai'),
(4, 'Marketing', 'Pune');

Insert into Employee (emp_id, emp_name, age, salary, designation, address, doj, dept_id) 
values (101, 'Amit Sharma', 35, 55000.00, 'HR Manager', 'Delhi', '2018-05-15', 1),
(102, 'Sneha Verma', 28, 65000.00, 'Software Engineer', 'Bangalore', '2020-07-10', 2),
(103, 'Ravi Patel', 42, 72000.00, 'Accountant', 'Mumbai', '2015-03-20', 3),
(104, 'Neha Singh', 30, 60000.00, 'Marketing Executive', 'Pune', '2019-11-01', 4),
(105, 'Arjun Mehta', 25, 50000.00, 'Support Engineer', 'Bangalore', '2021-08-12', 2);


3. UPDATE QUERY
Q3. The company has announced a ₹5000 salary increment for all employees working as
‘Developer’.
Write an SQL query to update the salary accordingly.
Update Employee
SET salary = salary + 5000
WHERE designation = 'Software Engineer';
select * from Employee;
 '101', 'Amit Sharma', '35', '55000.00', 'HR Manager', 'Delhi', '2018-05-15', '1'
'102', 'Sneha Verma', '28', '75000.00', 'Software Engineer', 'Bangalore', '2020-07-10', '2'
'103', 'Ravi Patel', '42', '72000.00', 'Accountant', 'Mumbai', '2015-03-20', '3'
'104', 'Neha Singh', '30', '60000.00', 'Marketing Executive', 'Pune', '2019-11-01', '4'
'105', 'Arjun Mehta', '25', '50000.00', 'Support Engineer', 'Bangalore', '2021-08-12', '2'

4. SELECT with AGGREGATE FUNCTIONS
Q4. Display the total number of employees, average salary, highest salary, and lowest
salary for each department.
select 
dept_id,
COUNT(emp_id),
avg(salary),
max(salary),
min(salary)
from Employee
group by dept_id;
'1', '1', '55000.000000', '55000.00', '55000.00'
'2', '2', '62500.000000', '75000.00', '50000.00'
'3', '1', '72000.000000', '72000.00', '72000.00'
'4', '1', '60000.000000', '60000.00', '60000.00'


5. SELECT with STRING FUNCTIONS
Q5. Display each employee’s name and designation in uppercase and also show a new
column combining their name and job title in a single sentence like:
“Ananya Rao works as HR Executive”.
select upper(emp_name),upper(designation),	
concat(emp_name, "works as", designation)
from Employee;
'AMIT SHARMA', 'HR MANAGER', 'Amit Sharmaworks asHR Manager'
'SNEHA VERMA', 'SOFTWARE ENGINEER', 'Sneha Vermaworks asSoftware Engineer'
'RAVI PATEL', 'ACCOUNTANT', 'Ravi Patelworks asAccountant'
'NEHA SINGH', 'MARKETING EXECUTIVE', 'Neha Singhworks asMarketing Executive'
'ARJUN MEHTA', 'SUPPORT ENGINEER', 'Arjun Mehtaworks asSupport Engineer'

6. SELECT with DATE FUNCTIONS
Q6. Write a query to display each employee’s joining year and the number of years they
have worked in the company till date.
select emp_name, year(doj),
year(curdate())-year(doj)
from Employee;
'Amit Sharma', 2018, '7'
'Sneha Verma', 2020, '5'
'Ravi Patel', 2015, '10'
'Neha Singh', 2019, '6'
'Arjun Mehta', 2021, '4'

7. SELECT using OPERATORS
Q7. List the names and salaries of employees whose salary is between ₹40,000 and
₹80,000, excluding those who belong to the Sales department.
Select
    emp_name,
    salary
from Employee
WHERE salary BETWEEN 40000 AND 80000
AND dept_id NOT IN (
    SELECT dept_id FROM Department WHERE dept_name = 'Sales'
);
'Amit Sharma', '55000.00'
'Sneha Verma', '75000.00'
'Ravi Patel', '72000.00'
'Neha Singh', '60000.00'
'Arjun Mehta', '50000.00'

8. INNER JOIN QUERY
Q8. Write a query to display each employee’s name, designation, department name, and
location using an INNER JOIN between Employee and Department tables.
Select 
    e.emp_name,
    e.designation,
    d.dept_name,
    d.location
FROM Employee e
INNER JOIN Department d
ON e.dept_id = d.dept_id;

'Amit Sharma', 'HR Manager', 'Human Resources', 'Delhi'
'Sneha Verma', 'Software Engineer', 'IT', 'Bangalore'
'Arjun Mehta', 'Support Engineer', 'IT', 'Bangalore'
'Ravi Patel', 'Accountant', 'Finance', 'Mumbai'
'Neha Singh', 'Marketing Executive', 'Marketing', 'Pune'

9. LEFT OUTER JOIN QUERY
Q9. Display all employees and their department names using a LEFT OUTER JOIN.
(Include employees even if they are not assigned to any department.)
select
    e.emp_name,
    d.dept_name
FROM Employee e
LEFT JOIN Department d
ON e.dept_id = d.dept_id;

'Amit Sharma', 'Human Resources'
'Sneha Verma', 'IT'
'Ravi Patel', 'Finance'
'Neha Singh', 'Marketing'
'Arjun Mehta', 'IT'

10. RIGHT OUTER JOIN QUERY
Q10. Display all departments and the employees working in them using a RIGHT OUTER
JOIN.
(Include departments even if they currently have no employees.)
Select
    e.emp_name,
    d.dept_name
FROM Employee e
right join Department d
ON e.dept_id = d.dept_id;

'Amit Sharma', 'Human Resources'
'Sneha Verma', 'IT'
'Arjun Mehta', 'IT'
'Ravi Patel', 'Finance'
'Neha Singh', 'Marketing'

11. STORED PROCEDURE – INSERT
Q11. Create a stored procedure named InsertEmployee that accepts employee details as
parameters and inserts a new record into the Employee table.
Execute the procedure to insert a new employee record.
DELIMITER $$
create Procedure InsertEmployee(
   IN p_emp_name VARCHAR(50),
    IN p_designation VARCHAR(50),
    IN p_salary DECIMAL(10,2),
    IN p_dept_id INT,
    IN p_doj DATE
)
Begin
insert into Employee(emp_name,designation,salary,dept_id,doj)
values (p_emp_name, p_designation, p_salary, p_dept_id, p_doj);
END $$
DELIMITER ;
 call InsertEmployee('Koushal Mandal','HR Executive',55000.00,044,'2023-10-06');
 
12. STORED PROCEDURE – UPDATE
Q12. Create a stored procedure named UpdateSalary that updates an employee’s salary
based on their emp_id.
Call the procedure to update a specific employee’s salary.
DELIMITER $$
CREATE PROCEDURE UpdateSalary(
    IN p_emp_id INT,
    IN p_new_salary DECIMAL(10,2)
)
BEGIN
    UPDATE Employee
    set salary = p_new_salary
    where emp_id = p_emp_id;
END $$
DELIMITER ;
call UpdateSalary(101, 75000);
SELECT emp_id, emp_name, salary FROM Employee Where emp_id = 101;
'101', 'Amit Sharma', '75000.00'

13. STORED PROCEDURE – DELETE
Q13. Create a stored procedure named DeleteEmployee that deletes an employee record
from the Employee table based on the given emp_id.
Call the procedure to remove an employee record.
DELIMITER $$
CREATE PROCEDURE DeleteEmployee(
    IN p_emp_id INT
)
BEGIN
    DELETE FROM Employee
    WHERE emp_id = p_emp_id;
END $$
DELIMITER ;
call DeleteEmployee(103);
select * from Employee;
-- Execute
CALL DeleteEmployee(103);

14. COMPREHENSIVE QUERY
Q14. Display a report showing:
 Employee Name
 Department Name
 Years Worked
 Salary after increment
for all employees who have worked more than 2 years in the company.
SELECT 
    e.emp_name AS Employee_Name,
    d.dept_name AS Department_Name,
    (YEAR(CURDATE()) - YEAR(e.doj)) AS Years_Worked,
    e.salary * 1.10 AS Salary_After_Increment   -- assuming 10% increment
FROM Employee e
INNER JOIN Department d
ON e.dept_id = d.dept_id
WHERE (YEAR(CURDATE()) - YEAR(doj)) > 2;
'Amit Sharma', 'Human Resources', '7', '82500.0000'
'Sneha Verma', 'IT', '5', '82500.0000'
'Neha Singh', 'Marketing', '6', '66000.0000'
'Arjun Mehta', 'IT', '4', '55000.0000'

