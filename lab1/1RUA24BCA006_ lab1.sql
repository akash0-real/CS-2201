-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: Akash bisht
-- USN: 1RUA24BCA006
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : root@localhost	RVU-PC-058	9.4.0	2025-08-18 11:36:11;


-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:
create database	DBLab001;
use DBLab001;

-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:
create table Students(
	StudentID varchar(20) PRIMARY KEY,
    firstname varchar(50),
    lastname varchar(50),
    Email varchar(50) unique,
    dateofbirth date
);

DESC Students; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : # Field, Type, Null, Key, Default, Extra
-- 'StudentID', 'varchar(20)', 'NO', 'PRI', NULL, ''
-- 'firstname', 'varchar(50)', 'YES', '', NULL, ''
-- 'lastname', 'varchar(50)', 'YES', '', NULL, ''
-- 'Email', 'varchar(50)', 'YES', 'UNI', NULL, ''
-- 'dateofbirth', 'date', 'YES', '', NULL, ''



-- Alter the table and 2 new columns
-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table

ALTER table Students
add rollno int,
add marks int;

alter table Students
modify rollno varchar(40);

alter table Students
rename column marks to m1;

alter table Students
drop rollno;
rename table Students to people;

desc students;


-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:
create table courses(
	courseId varchar(20) PRImARY key,
    coursename varchar(30),
    credits int
);



DESC courses; 

-- OUTPUT : # Field, Type, Null, Key, Default, Extra
-- 'courseId', 'varchar(20)', 'NO', 'PRI', NULL, ''
-- 'coursename', 'varchar(30)', 'YES', '', NULL, ''
-- 'credits', 'int', 'YES', '', NULL, ''


-- Alter the table and 2 new columns
-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table

alter table courses
add dept varchar(20),
add duration varchar(20),
rename column coursename to cname,
drop credit;
rename table courses to ca;
desc ca;

-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
create table ENROLLMENTS(
	EnrollmentID varchar(40) primary key,
    StudentId varchar(40),
	Foreign Key (StudentId) references Students (StudentId),
    courseId varchar(40),
    Foreign Key (courseId) references ca (courseId),
    EnrollmentDate date
);

DESC ENROLLMENTS; 
-- OUTPUT :
/*
# Field, Type, Null, Key, Default, Extra
'EnrollmentID', 'varchar(40)', 'NO', 'PRI', NULL, ''
'StudentId', 'varchar(40)', 'YES', 'MUL', NULL, ''
'courseId', 'varchar(40)', 'YES', 'MUL', NULL, ''
'EnrollmentDate', 'date', 'YES', '', NULL, ''
*/


-- Alter the table and 2 new columns
-- Modify a column data type
-- Rename a column
-- Drop a column
-- Rename the table
alter table ENROLLMENTS
add ennno int,
add ennname varchar(40);
alter table enroll
rename column ennno to enrollment_names,
drop EnrollmentDate;
rename table ENROLLMENTS to enroll;
desc enroll;

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:
alter table Students
add phone_number int;

DESC Students;
/* # Field, Type, Null, Key, Default, Extra
'StudentID', 'varchar(20)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(50)', 'YES', '', NULL, ''
'lastname', 'varchar(50)', 'YES', '', NULL, ''
'Email', 'varchar(50)', 'YES', 'UNI', NULL, ''
'dateofbirth', 'date', 'YES', '', NULL, ''
'm1', 'int', 'YES', '', NULL, ''
'phone_number', 'int', 'YES', '', NULL, ''
*/

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:
alter table ca
add creadit int;
alter table ca
modify creadit decimal(10,5);

-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table
/*
# Tables_in_dblab001
'ca'
'enroll'
'students'
*/

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table ca;
drop table enroll;

SHOW TABLES; -- After dropping the table Enrollement and Course

 -- # Tables_in_dblab001
-- 'students'

-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01


