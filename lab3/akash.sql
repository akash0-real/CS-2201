-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: 
-- USN: 
-- SECTION: 
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command

# USER(), Host_Name, MySQL_Version, Current_Date_Time
-- 'root@localhost', 'RVU-PC-069', '9.4.0', '2025-09-01 05:51:05'



-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 
CREATE DATABASE lib;
use lib;

create table books(
	book_title varchar(50),
    Author_name varchar(50),
    total_copies int,
    availabe_copies int,
    book_id varchar(20) primary key
);

create table members(
	name varchar(50),
    membership_type varchar(40),
    date_joined date,
    membership_id varchar(30) primary key
);


desc members;
desc books;




-- Paste the Output below for the given command ( DESC TableName;)
/*
 # Field, Type, Null, Key, Default, Extra
'book_title', 'varchar(50)', 'YES', '', NULL, ''
'Author_name', 'varchar(50)', 'YES', '', NULL, ''
'total_copies', 'int', 'YES', '', NULL, ''
'availabe_copies', 'int', 'YES', '', NULL, ''
'book_id', 'varchar(20)', 'NO', 'PRI', NULL, ''
*/

 
/*  # Field, Type, Null, Key, Default, Extra
'name', 'varchar(50)', 'YES', '', NULL, ''
'membership_type', 'varchar(40)', 'YES', '', NULL, ''
'date_joined', 'date', 'YES', '', NULL, ''
'membership_id', 'varchar(30)', 'NO', 'PRI', NULL, ''
*/
alter table books
	add published_date date;
    
alter table books
	modify published_date int;    


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

insert into books values
('1984_The Black Swan', 'George Orwell', 10, 4, 'b1', '1949');


select * from books;
insert into books values
('hunger games', 'john phil', 20, 5, 'b2', '2000'),
('game of thrones', 'rr martin', 10, 3, 'b3', '2006'),
('the dance of the dragons', 'rr martin', 30, 10, 'b4', '2014'),
('the names of the winds', 'akash', 20, 5, 'b5', '2005');
INSERT INTO Books
VALUES ('The Catcher in the Rye', 'J.D. Salinger', 10, 2, '102',1951,'banglore');
 desc books;

select * from books;

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

/*
# book_title, Author_name, total_copies, availabe_copies, book_id, published_date
'1984_The Black Swan', 'George Orwell', '10', '4', 'b1', '1949'
'hunger games', 'john phil', '20', '5', 'b2', '2000'
'game of thrones', 'rr martin', '10', '3', 'b3', '2006'
'the dance of the dragons', 'rr martin', '30', '10', 'b4', '2014'
'the names of the winds', 'akash', '20', '5', 'b5', '2005'
*/


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
insert into members values
('David Lee', 'Platinum', '2024-04-15', 'm1'),
('Emma Wilson', 'Silver', '2024-05-22', 'm2'),
('john', 'Platinum', '2024-06-11', 'm3'),
('lily', 'Platinum', '2024-08-1', 'm4'),
('sarah', 'Platinum', '2024-09-1', 'm5');




select * from members;



-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
/*
# name, membership_type, date_joined, membership_id
'David Lee', 'Platinum', '2024-04-15', 'm1'
'Emma Wilson', 'Silver', '2024-05-22', 'm2'
'john', 'Platinum', '2024-06-11', 'm3'
'lily', 'Platinum', '2024-08-01', 'm4'
'sarah', 'Platinum', '2024-09-01', 'm5'
*/
alter table books
	add publisher_location varchar(30);


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
update books set availabe_copies = 4, total_copies= 12
where book_id = 'b1';






SELECT * FROM books;

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
/*
# book_title, Author_name, total_copies, availabe_copies, book_id, published_date, publisher_location
'1984_The Black Swan', 'George Orwell', '12', '4', 'b1', '1949', NULL
'hunger games', 'john phil', '20', '5', 'b2', '2000', NULL
'game of thrones', 'rr martin', '10', '3', 'b3', '2006', NULL
'the dance of the dragons', 'rr martin', '30', '10', 'b4', '2014', NULL
'the names of the winds', 'akash', '20', '5', 'b5', '2005', NULL
*/
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
update members set membership_type = 'gold'
where membership_id = 'm2';




SELECT * FROM members;



-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
/*
# name, membership_type, date_joined, membership_id
'David Lee', 'Platinum', '2024-04-15', 'm1'
'Emma Wilson', 'gold', '2024-05-22', 'm2'
'john', 'Platinum', '2024-06-11', 'm3'
'lily', 'Platinum', '2024-08-01', 'm4'
'sarah', 'Platinum', '2024-09-01', 'm5'

*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

delete from members
where membership_id = 'm1';


SELECT * FROM members;



-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
/*
# name, membership_type, date_joined, membership_id
'Emma Wilson', 'gold', '2024-05-22', 'm2'
'john', 'Platinum', '2024-06-11', 'm3'
'lily', 'Platinum', '2024-08-01', 'm4'
'sarah', 'Platinum', '2024-09-01', 'm5'

*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
create table borrowing(
book_id varchar(30),
members_id varchar(50),
foreign key(book_id) references books(book_id),
foreign key(members_id) references members(membership_id),
borrow_id int primary key
);
alter table borrowing 
add book_title varchar(50),
add borrowing_date date;

alter table borrowing 
add borrower_name varchar(50);

INSERT INTO Borrowing 
VALUES (102, 'm2', 2, 'The Catcher in the Rye','2024-06-01','Emma Wilson');










-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
SELECT * FROM borrowing;

/*
# book_id, members_id, borrow_id, book_title, borrowing_date, borrower_name
'102', 'm2', '2', 'The Catcher in the Rye', '2024-06-01', 'Emma Wilson'

*/
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
select * from borrowing where book_id ='102';







-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
/*
# book_id, members_id, borrow_id, book_title, borrowing_date, borrower_name
'102', 'm2', '2', 'The Catcher in the Rye', '2024-06-01', 'Emma Wilson'

*/

-- ------------------------------------------------------------------------------------------------------------------------------------------



-- END of the Task -- 
