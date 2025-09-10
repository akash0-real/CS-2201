create database schools;
use schools;

Create table Student (
S_ID INT PRIMARY KEY,
FName VARCHAR(20),
LName VARCHAR(20),
DOB DATE,
Class VARCHAR(5),
Marks INT,
City VARCHAR(25)
);

Create table Teacher (
T_ID int PRIMARY KEY,
FName VARCHAR(20),
LName VARCHAR(25),
Sub VARCHAR(20),
HireDate DATE,
Salary DECIMAL(10,2)
);

Create table Course (
C_ID INT PRIMARY KEY,
CName VARCHAR(30),
Credits int
);

Create table Enroll (
E_ID int PRIMARY KEY,
S_ID int,
C_ID int,
Grade varchar(5),
FOREIGN KEY (S_ID) REFERENCES Student(S_ID),
FOREIGN KEY (C_ID) REFERENCES Course(C_ID)
);

Insert into Student values
(1, 'Lewis', 'Hamilton', '1985-01-07', '12A', 95, 'Goa'),
(2, 'Max', 'Verstappen', '1997-09-30', '11B', 92, 'Mumbai'),
(3, 'Sebastian', 'Vettel', '1987-07-03', '12B', 88, 'Manglore'),
(4, 'Fernando', 'Alonso', '1981-07-29', '12A', 85, 'Kodakara'),
(5, 'Charles', 'Leclerc', '1997-10-16', '11A', 90, 'Mapranam'),
(6, 'Lando', 'Norris', '1999-11-13', '11C', 87, 'Bristol'),
(7, 'Carlos', 'Sainz', '1989-07-01', '12C', 89, 'Pune'),
(8, 'George', 'Russell', '1998-02-15', '11B', 86, 'Majestic'),
(9, 'Franco', 'Colapanto', '1979-10-17', '12B', 84, 'Potta'),
(10, 'Gabriel', 'Bortoleto', '1989-08-28', '12C', 85, 'Kothrud');

insert into Teacher  values
(100, 'Senne', 'Lammens', 'DBMS', '2011-07-01', 3500000),
(102, 'Harry', 'Maguire', 'Java', '2019-08-05', 2200000),
(103, 'Bruno', 'Fernandes', 'Criminology', '2020-01-29', 3000000),
(104, 'Marcus', 'Rashford', 'C', '2016-02-25', 2700000),
(105, 'Kobbie', 'Mainoo', 'Python', '2016-08-08', 3200000),
(106, 'Leny', '	Yoro', 'Java', '2014-09-01', 1800000),
(107, 'Matheus', 'Cunha', 'German', '2019-11-01', 1500000),
(108, 'Jim', 'Thwaites', 'Python', '2018-07-05', 1900000),
(109, 'Bryan', 'Mbuemo', 'Python', '2017-03-15', 1700000),
(110, 'Patrick', 'Dorgu', 'DBMS', '2017-07-13', 1600000);

Insert into Course values
(1, 'BCA', 4),
(2, 'BBA', 3),
(3, 'BCOM', 3),
(4, 'English ', 2),
(5, 'LLB', 3);

INSERT INTO Enroll (E_ID, S_ID, C_ID, Grade) VALUES
(1, 1, 1, 'A'),
(2, 1, 2, 'B'),
(3, 2, 1, 'A'),
(4, 2, 3, 'C'),
(5, 3, 4, 'B'),
(6, 4, 5, 'A'),
(7, 5, 1, 'B'),
(8, 5, 2, 'A'),
(9, 6, 3, 'C');

Select * From Student;
/*

# S_ID, FName, LName, DOB, Class, Marks, City
'1', 'Lewis', 'Hamilton', '1985-01-07', '12A', '95', 'Goa'
'2', 'Max', 'Verstappen', '1997-09-30', '11B', '92', 'Mumbai'
'3', 'Sebastian', 'Vettel', '1987-07-03', '12B', '88', 'Manglore'
'4', 'Fernando', 'Alonso', '1981-07-29', '12A', '85', 'Kodakara'
'5', 'Charles', 'Leclerc', '1997-10-16', '11A', '90', 'Mapranam'
'6', 'Lando', 'Norris', '1999-11-13', '11C', '87', 'Bristol'
'7', 'Carlos', 'Sainz', '1989-07-01', '12C', '89', 'Pune'
'8', 'George', 'Russell', '1998-02-15', '11B', '86', 'Majestic'
'9', 'Franco', 'Colapanto', '1979-10-17', '12B', '84', 'Potta'
'10', 'Gabriel', 'Bortoleto', '1989-08-28', '12C', '85', 'Kothrud'

*/

Select right(CName, 3) from Course;
/*
'BCA'
'BBA'
'COM'
'sh '
'LLB'
*/

Select concat(FName, ' ', LName) from Teacher;
/*
'Senne Lammens'
'Harry Maguire'
'Bruno Fernandes'
'Marcus Rashford'
'Kobbie Mainoo'
'Leny 	Yoro'
'Matheus Cunha'
'Jim Thwaites'
'Bryan Mbuemo'
'Patrick Dorgu'
*/

Select S_ID, char_length(Concat(FName, LName)) from Student;
/*
'1', '13'
'2', '13'
'3', '15'
'4', '14'
'5', '14'
'6', '11'
'7', '11'
'8', '13'
'9', '15'
'10', '16'
*/

Select C_ID, replace(CName, 'BCA', 'BCA(Hons)')from  Course;
/*
'1', 'BCA(Hons)'
'2', 'BBA'
'3', 'BCOM'
'4', 'English '
'5', 'LLB'
*/

Select T_ID, round(Salary,-3) from Teacher;
/*
'100', '3500000'
'102', '2200000'
'103', '3000000'
'104', '2700000'
'105', '3200000'
'106', '1800000'
'107', '1500000'
'108', '1900000'
'109', '1700000'
'110', '1600000'
*/

Select C_ID, sqrt(Credits) from Course;
/*
'1', '2'
'2', '1.7320508075688772'
'3', '1.7320508075688772'
'4', '1.4142135623730951'
'5', '1.7320508075688772'
*/

Select Marks, ceil(Marks), floor(Marks) from Student;
/*
 Marks, ceil(Marks), floor(Marks)
'95', '95', '95'
'92', '92', '92'
'88', '88', '88'
'85', '85', '85'
'90', '90', '90'
'87', '87', '87'
'89', '89', '89'
'86', '86', '86'
'84', '84', '84'
'85', '85', '85'
*/

Select (sum(Marks) % 5) from Student;

Select now();
/*
'2025-09-10 12:39:22'
*/

Select T_ID, year(HireDate), month(HireDate) from Teacher;
/*

# T_ID, year(HireDate), month(HireDate)
'100', 2011, '7'
'102', 2019, '8'
'103', 2020, '1'
'104', 2016, '2'
'105', 2016, '8'
'106', 2014, '9'
'107', 2019, '11'
'108', 2018, '7'
'109', 2017, '3'
'110', 2017, '7'

*/

Select * from Student where month(DOB) = 1;
/*
 S_ID, FName, LName, DOB, Class, Marks, City
'1', 'Lewis', 'Hamilton', '1985-01-07', '12A', '95', 'Goa'
*/

Select T_ID, datediff(now(), HireDate) from Teacher;
/*
'100', '5185'
'102', '2228'
'103', '2051'
'104', '3485'
'105', '3320'
'106', '4027'
'107', '2140'
'108', '2624'
'109', '3101'
'110', '2981'
*/

Select count(*)FROM Student;
/*
'10'
*/

Select avg(Salary) from Teacher;
/*
'2310000.000000'
*/

Select max(Marks), min(Marks) from Student;
/*

 max(Marks), min(Marks)
'95', '84'

*/
