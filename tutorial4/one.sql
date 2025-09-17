CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Price int,
    PublishDate DATE
);

CREATE TABLE Customers (
    CustID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    JoinDate DATE
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustID INT,
    BookID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustID) REFERENCES Customers(CustID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Books VALUES
(101, 'name of the wind', 'Me', 350, '2010-06-15'),
(102, 'gameofthrones', 'you', 450, '2018-10-16'),
(103, 'thinklikeme', 'rosberg', 550, '2008-08-01'),
(104, 'Hello', 'anothy', 400, '2020-09-08'),
(105, 'howtosayno', 'mandala', 500, '2019-05-10');

INSERT INTO Customers VALUES
(201, 'Akash', 'akash@gmail.com', '2021-02-10'),
(202, 'Priya', 'priya@yahoo.com', '2020-07-25'),
(203, 'jon pork', 'jon@gmail.com', '2022-01-14'),
(204, 'Maria', 'maria@outlook.com', '2019-11-30');

INSERT INTO Orders VALUES
(301, 201, 102, '2022-03-05', 2),
(302, 202, 101, '2021-09-12', 1),
(303, 203, 105, '2022-05-20', 3),
(304, 204, 104, '2020-12-25', 1),
(305, 201, 103, '2021-11-18', 1);

SELECT UPPER(Name) AS UpperName FROM Customers;
SELECT LOWER(Name) AS LowerName FROM Customers;
SELECT LEFT(Title, 3) AS First3Letters FROM Books;
SELECT SUBSTRING_INDEX(Email, '@', -1) AS Domain FROM Customers;
SELECT Title, LENGTH(Title) AS TitleLength FROM Books;
SELECT REPLACE(Title, 'Book', 'Text') AS ModifiedTitle FROM Books;
SELECT CONCAT(Author, ' - ', Title) AS AuthorBook FROM Books;
SELECT Title FROM Books WHERE Author LIKE '%a%';
SELECT Title, YEAR(PublishDate) AS PublishYear FROM Books;
SELECT Name, MONTHNAME(JoinDate) AS JoinMonth FROM Customers;
SELECT * FROM Customers WHERE YEAR(JoinDate) = 2021;
SELECT OrderID, DAYNAME(OrderDate) AS OrderDay FROM Orders;
SELECT Title, TIMESTAMPDIFF(YEAR, PublishDate, CURDATE()) AS BookAge FROM Books;
SELECT Name, DATEDIFF(CURDATE(), JoinDate) AS DaysSinceJoin FROM Customers;
SELECT * FROM Orders WHERE MONTH(OrderDate) = 12;
SELECT COUNT(*) AS TotalBooks FROM Books;
SELECT AVG(Price) AS AvgPrice FROM Books;
SELECT MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice FROM Books;
SELECT COUNT(*) AS CustomersAfter2020 FROM Customers WHERE YEAR(JoinDate) > 2020;
SELECT SUM(Quantity) AS TotalBooksOrdered FROM Orders;
SELECT CustID, SUM(Quantity) AS TotalOrdered FROM Orders GROUP BY CustID;
SELECT BookID, AVG(Quantity) AS AvgQty FROM Orders GROUP BY BookID;
select sum(quantity) from orders;
select sum(price) from orders;
