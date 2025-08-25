-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: akash bisht
-- USN: 1RUA24BCA006
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : # USER(), Host_Name, MySQL_Version, Current_Date_Time
-- 'root@localhost', 'DESKTOP-DP988V4', '8.4.6', '2025-08-25 11:18:38'


-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:
create database college_students;
use college_students;

-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:
create table departments(
	deptid varchar(20) primary key,
    deptname varchar(30),
    hod varchar(20),
    contactemail varchar(30),
    phonenum int,
    location varchar(50)
);
create table course(
	courseid varchar(30) primary key,
    coursename varchar(20),
    credits int,
    deptid varchar(20),
    foreign key(deptid) references departments(deptid),
    duration varchar(30),
    feees int
);
create table students(
	studentid varchar(30) primary key,
    fname varchar(20),
    lname varchar(20),
    email varchar(30),
    dob date,
    courseid varchar(30),
    foreign key(courseid) references course(courseid)

);
create table faculty(
	enrollmentid varchar(20) primary key,
    facultyname varchar(30),
    courseid varchar(30),
    deptid varchar(20),
    foreign key(deptid) references departments(deptid),
	foreign key(courseid) references course(courseid),
    email varchar(30),
    phonenumber int

);
create table enrollments(
	facultyid varchar(20) primary key,
    studentid varchar(30),
    deptid varchar(20),
    foreign key(studentid) references students(studentid),
    semester varchar(30),
    grade varchar(30),
    year int

);


-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code


--  describe the structure of each table and copy paste the Output 
desc students;
/*
 Field, Type, Null, Key, Default, Extra
'studentid', 'varchar(30)', 'NO', 'PRI', NULL, ''
'fname', 'varchar(20)', 'YES', '', NULL, ''
'lname', 'varchar(20)', 'YES', '', NULL, ''
'email', 'varchar(30)', 'YES', '', NULL, ''
'dob', 'date', 'YES', '', NULL, ''
'courseid', 'varchar(30)', 'YES', 'MUL', NULL, ''
*/
desc course;
/*
# Field, Type, Null, Key, Default, Extra
'courseid', 'varchar(30)', 'NO', 'PRI', NULL, ''
'coursename', 'varchar(20)', 'YES', '', NULL, ''
'credits', 'int', 'YES', '', NULL, ''
'deptid', 'varchar(20)', 'YES', 'MUL', NULL, ''
'duration', 'varchar(30)', 'YES', '', NULL, ''
'feees', 'int', 'YES', '', NULL, ''
*/
desc departments;
/*
# Field, Type, Null, Key, Default, Extra
'deptid', 'varchar(20)', 'NO', 'PRI', NULL, ''
'deptname', 'varchar(30)', 'YES', '', NULL, ''
'hod', 'varchar(20)', 'YES', '', NULL, ''
'contactemail', 'varchar(30)', 'YES', '', NULL, ''
'phonenum', 'int', 'YES', '', NULL, ''
'location', 'varchar(50)', 'YES', '', NULL, ''
*/
desc faculty;
/*
# Field, Type, Null, Key, Default, Extra
'facultyid', 'varchar(20)', 'NO', 'PRI', NULL, ''
'facultyname', 'varchar(30)', 'YES', '', NULL, ''
'deptid', 'varchar(20)', 'YES', 'MUL', NULL, ''
'qualification', 'varchar(30)', 'YES', '', NULL, ''
'email', 'varchar(30)', 'YES', '', NULL, ''
'phonenumber', 'int', 'YES', '', NULL, ''
*/
desc enrollments;
/*
# Field, Type, Null, Key, Default, Extra
'facultyid', 'varchar(20)', 'NO', 'PRI', NULL, ''
'studentid', 'varchar(30)', 'YES', 'MUL', NULL, ''
'deptid', 'varchar(20)', 'YES', '', NULL, ''
'semester', 'varchar(30)', 'YES', '', NULL, ''
'grade', 'varchar(30)', 'YES', '', NULL, ''
'year', 'int', 'YES', '', NULL, ''
*/


-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
-- 02: Modify the existing column from each table
-- 03 change the datatypes
-- 04: Rename a column
-- 05: Drop a column
-- 06: Rename the table
-- 07: describe the structure of the new table
alter table students
	add	parentname varchar(20),
    add marks varchar(30);
    
alter table course
	add	coursecode varchar(20),
    add startdate date;
    
alter table faculty
	add	age int,
    add coursename varchar(30);  
    
alter table enrollments
	add	joindate date,
    add staitus varchar(30);   
   
alter table departments
	add	numberofstudents int,
    add numberoffacullty int;
   
-- modifying tables

alter table students
	modify column marks int;
    
alter table faculty
	modify column age date;
 
alter table departments
	modify column location varchar(50);
    
alter table enrollments
	modify column staitus int;
    
alter table course
	modify column coursecode int;
    
-- changing the datatype
 alter table course
	modify column coursecode varchar(20);
    
alter table students
	modify column marks varchar(30);
    
alter table faculty
	modify column age int;
    
alter table enrollments
	modify column staitus varchar(20);    
    
alter table departments
	modify column location int;    
    
--  Renaming a column   
alter table students 
	rename column marks to marks_1;
    
alter table course 
	rename column coursecode to coursecode_1;
    
alter table faculty 
	rename column age to curremt_age;
    
alter table enrollments 
	rename column staitus to stats;
    
alter table departments 
	rename column location to current_location;
    
-- droping a column

alter table students
	drop column marks_1;
     
alter table course
	drop column coursecode_1;     

alter table faculty
	drop column curremt_age;

alter table enrollments
	drop column stats;
    
alter table departments
	drop column current_location;   
    
-- renaming a table
rename table students to student;
rename table course to courses;
rename table faculty to faculties;
rename table enrollments to enroll;
rename table departments to department; 

desc student;
/*
# Field, Type, Null, Key, Default, Extra
'studentid', 'varchar(30)', 'NO', 'PRI', NULL, ''
'fname', 'varchar(20)', 'YES', '', NULL, ''
'lname', 'varchar(20)', 'YES', '', NULL, ''
'email', 'varchar(30)', 'YES', '', NULL, ''
'dob', 'date', 'YES', '', NULL, ''
'courseid', 'varchar(30)', 'YES', 'MUL', NULL, ''
'parentname', 'varchar(20)', 'YES', '', NULL, ''
*/
desc courses;
/*
# Field, Type, Null, Key, Default, Extra
'courseid', 'varchar(30)', 'NO', 'PRI', NULL, ''
'coursename', 'varchar(20)', 'YES', '', NULL, ''
'credits', 'int', 'YES', '', NULL, ''
'deptid', 'varchar(20)', 'YES', 'MUL', NULL, ''
'duration', 'varchar(30)', 'YES', '', NULL, ''
'feees', 'int', 'YES', '', NULL, ''
'startdate', 'date', 'YES', '', NULL, ''
*/
desc faculties;    
/*
# Field, Type, Null, Key, Default, Extra
'facultyid', 'varchar(20)', 'NO', 'PRI', NULL, ''
'facultyname', 'varchar(30)', 'YES', '', NULL, ''
'deptid', 'varchar(20)', 'YES', 'MUL', NULL, ''
'qualification', 'varchar(30)', 'YES', '', NULL, ''
'email', 'varchar(30)', 'YES', '', NULL, ''
'phonenumber', 'int', 'YES', '', NULL, ''
'coursename', 'varchar(30)', 'YES', '', NULL, ''
*/
desc enroll;
/*
# Field, Type, Null, Key, Default, Extra
'facultyid', 'varchar(20)', 'NO', 'PRI', NULL, ''
'studentid', 'varchar(30)', 'YES', 'MUL', NULL, ''
'deptid', 'varchar(20)', 'YES', '', NULL, ''
'semester', 'varchar(30)', 'YES', '', NULL, ''
'grade', 'varchar(30)', 'YES', '', NULL, ''
'year', 'int', 'YES', '', NULL, ''
'joindate', 'date', 'YES', '', NULL, ''
*/
desc department;
/*
# Field, Type, Null, Key, Default, Extra
'deptid', 'varchar(20)', 'NO', 'PRI', NULL, ''
'deptname', 'varchar(30)', 'YES', '', NULL, ''
'hod', 'varchar(20)', 'YES', '', NULL, ''
'contactemail', 'varchar(30)', 'YES', '', NULL, ''
'phonenum', 'int', 'YES', '', NULL, ''
'numberofstudents', 'int', 'YES', '', NULL, ''
'numberoffacullty', 'int', 'YES', '', NULL, ''
*/

/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
--2 Add a column Gender (CHAR(1)) to the Students table.
--3 Add a column JoiningDate (DATE) to the Faculty table.
--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
--5 Modify the column Location in the Departments table to VARCHAR(80).
--6 Rename the column Qualification in the Faculty table to Degree.
--7 Rename the table Faculty to Teachers.
--8 Drop the column PhoneNumber from the Departments table.
--9 Drop the column Email from the Students table.
--10 Drop the column Duration from the Courses table.
*/
alter table student
	add address varchar(100);
alter table student
	add gender char(1);   

alter table faculties
	add JoiningDate date;
    
alter table courses
	modify coursename varchar(100);
    
alter table department
	modify hod varchar(80);    

alter table faculties
	add column qualification varchar(50);
  
alter table faculties
	rename column qualification to degree;
    
rename table faculties to teachers;

alter table department
	drop column phonenum;
    
alter table student
	drop column email; 
  
alter table courses
	drop column duration;   

SHOW TABLES; -- Before dropping the table
/* 
# Tables_in_college_students
'courses'
'department'
'enroll'
'student'
'teachers'
*/


-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table enroll;
drop table courses;

SHOW TABLES; -- After dropping the table Enrollement and Course
/*
# Tables_in_college_students
'department'
'student'
'teachers'
*/
