-- Create Database called "Bookstore"
CREATE DATABASE Bookstore;

--  Use "Bookstore" database
USE Bookstore;

-- Create the Books table with the specified fields.
Create table Books (
Bookid varchar(10) primary key,
Bookname varchar(20),
Category varchar(20));

-- Insert records into Books table
Insert into Books values ('B101', 'Science Revolution', 'Journal');
Insert into Books values ('B102', 'Brain Teasers', 'Aptitude');
Insert into Books values ('B103', 'India Today', 'Magazine');
Insert into Books values ('B104', 'Tech World', 'Journal');
Insert into Books values ('B105', 'Bizz world', 'Magazine');
Insert into Books values ('B106', 'The Quests', 'Aptitude');

select * from Books;

-- Create the customer table with the specified fields.
create table customer(
custid varchar(10) primary key,
custname varchar(20));

select * from customer;

-- Insert records into customer table
Insert into customer values('C101', 'Jack');
Insert into customer values('C102', 'Anne');
Insert into customer values('C103', 'Jane');
Insert into customer values('C104', 'Maria');


-- Create the Purchase table with the specified fields.
create table purchase(
purchaseid varchar(10) primary key,
custid varchar(10) references customer(custid),
bookid varchar(10) references book(bookid),
purchasedate date );

select * from purchase;

-- Insert records into purchase table
Insert into purchase values ('P201','C101', 'B102','2019-12-12');
Insert into purchase values ('P202','C102','B103','2019-11-25');
Insert into purchase values ('P203','C103', 'B104','2019-12-12');
Insert into purchase values ('P204','C104', 'B105','2019-11-25');
Insert into purchase values ('P205','C101', 'B101','2019-12-11');
Insert into purchase values ('P206','C101', 'B106','2019-12-12');

-- SELECT statement to retrieve all records from the Books table.
SELECT * FROM Books;

-- SELECT statement to retrieve all records from the Customer table.
SELECT * FROM customer;

-- SELECT statement to retrieve all records from the purchase table.
SELECT * FROM purchase;


#Requirement 1:
/* 
Identify the purchase details of books, that are purchased exactly on different dates by the same 
customer(s). Write a query to display customer’s id and number of such purchases to be 
displayed as BOOKS for the identified purchase details.
*/

SELECT p.Custid, COUNT(DISTINCT p.Purchasedate) AS BOOKS
FROM purchase p
GROUP BY p.Custid
HAVING COUNT(DISTINCT p.Purchasedate) > 1;

#Requirement 2 :
/* 
Identify the purchase details of books, where the books of the same category are purchased by 
different customers on different dates. Write a query to display customer’s id and title of the 
book for the identified purchase details.
*/

SELECT p1.Custid, b.Bookname, COUNT(p1.purchaseid) AS BOOKS
FROM purchase p1
JOIN purchase p2 ON p1.Custid = p2.Custid AND p1.purchasedate <> p2.purchasedate
JOIN books b ON p1.bookid = b.bookid
GROUP BY p1.Custid, b.Bookname
HAVING COUNT(DISTINCT p1.purchasedate);


#Requirement 3 :
/*
Identify the purchase details of books, where the book is purchased on the same date, exactly on 
the date Anne has purchased the book. Write a query to display customer’s name and title of the 
book for the identified purchase details. Do NOT display details of Anne in the query result.
*/

SELECT c.custname, b.Bookname
FROM purchase p
JOIN customer c ON p.custid = c.custid
JOIN books b ON p.bookid = b.bookid
WHERE p.purchasedate IN (
    SELECT purchasedate
    FROM purchase
    WHERE custid = 'C102'
)
AND c.custid != 'C102';




