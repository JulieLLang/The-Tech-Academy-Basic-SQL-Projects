CREATE DATABASE db_Library;

USE db_library;

	CREATE TABLE tbl_Library_Branch (
		BranchId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		BranchName VARCHAR(50),
		Address VARCHAR(75) 
	);


	CREATE TABLE tbl_Publisher (
		PublisherName VARCHAR(75) PRIMARY KEY NOT NULL, 
		Address VARCHAR(75),
		Phone VARCHAR(25)
	);


	CREATE TABLE tbl_Books (
		BookId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		Title VARCHAR(75) NOT NULL,
		PublisherName VARCHAR(75) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES tbl_Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE tbl_Authors (
		BookId INT NOT NULL CONSTRAINT fk_BookId FOREIGN KEY REFERENCES tbl_Books(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
		AuthorName VARCHAR(75) NOT NULL
	);


	CREATE TABLE tbl_Copies (
		BookId INT NOT NULL CONSTRAINT fk_BookId_Copies FOREIGN KEY REFERENCES tbl_Books(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchId INT NOT NULL CONSTRAINT fk_BranchId_Copies FOREIGN KEY REFERENCES tbl_Library_Branch(BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
		NumberCopies INT NOT NULL
	);


	CREATE TABLE tbl_Borrower (
		CardNo INT IDENTITY(1,1) PRIMARY KEY,
		Name VARCHAR(75) NOT NULL,
		Address VARCHAR(75) NOT NULL,
		Phone VARCHAR(25)
	);

	CREATE TABLE tbl_Loans (
		BookId INT NOT NULL CONSTRAINT fk_BookId_Loans FOREIGN KEY REFERENCES tbl_Books(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchId INT NOT NULL,
		CardNo INT NOT NULL CONSTRAINT fk_CardNo_Loans FOREIGN KEY REFERENCES tbl_Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		DateOut DATE NOT NULL,
		DateDue DATE NOT NULL
	);

	SELECT * FROM tbl_Library_Branch;
	SELECT * FROM tbl_Publisher;
	SELECT * FROM tbl_Books;
	SELECT * FROM tbl_Authors;
	SELECT * FROM tbl_Copies;
	SELECT * FROM tbl_Loans;
	SELECT * FROM tbl_Borrower;

	USE db_Library
	/******************************************************
	 * Now that the tables are built, we populate them
	 ******************************************************/

	 INSERT INTO tbl_Library_Branch
		(BranchName, Address)
		VALUES 
		('Central', '1234 Main St'),
		('Eastside', '555 N Main St'),
		('Sharpstown', '666 Knife Way'),
		('St. John', '777 Paradise Ave'),
		('Clackamus', '989 N Hwy 78'),
		('Gresham', '1565 W Powell Blvd'),
		('Downtown', '1234 Second Street'),
		('Vancouver', '323 Third Ave'),
		('Camus', '234 Fourth Street'),
		('Washougal', '767 Fifth Ave'),
		('Troutdale', '156 Sixth Street'),
		('Fern Valley', '888 Seveth Ave'),
		('Fairview', '9976 Eigth Ave'),
		('Rockwood', '555 Police Way'),
		('Sandy', '1415 Fifthtenth Street'),
		('Boring', '765 7 Of 9 Way'),
		('Multnomah', '8754 Voyger Blvd'),
		('Enterprise', '675 San Francisco St'),
		('The Captain Picard Memorial Library', '7765 Star Trek Lane'),
		('Whosville', '654 Whatyamacallit Lane')

	;
	SELECT * FROM tbl_Library_Branch;

	INSERT INTO tbl_Publisher
		(PublisherName, Address, Phone)
		VALUES
		('Simon & Schuster', 'New York, New Tork', '555-555-1233'),
		('Orbit Books', 'Taos, New Mexico', '555-555-8990'),
		('Bantam Spectra', 'Rodchester, New York', '555-555-3435'),
		('Allen & Unwin', 'Cheshire, United Kingdom', '41-45-7780-8999'),
		('Bantam Books', 'Gothom, ChickenTown', '555-676-9000'),
		('Penguin Random House', 'Birdbrain, South Pole', '555-876-0010'),
		('Ballantine Books', 'Toronto, Canada', '1-234-677-5555'),
		('Tor Books', 'Tor, Spain', '3-56-675-7765'),
		('Dial Press', 'SoapBox, Vermont', '676-555-9065'),
		('Orion Publishing Group', 'London, United Kingdom', '44-28-8976-5555')
	;
	SELECT * FROM tbl_Publisher;

	INSERT INTO tbl_Books
		(Title, PublisherName)
		VALUES
		('Pet Cemetary', 'Simon & Schuster'),
		('The Stand', 'Simon & Schuster'),
		('Abaddon''s Gate', 'Orbit Books'),
		('Caliban''s War', 'Orbit Books'),
		('A Dance with Dragons', 'Bantam Spectra'),
		('A Game of Thrones', 'Bantam Spectra'),
		('The Hobbit', 'Allen & Unwin'),
		('The Lord of the Rings: The Two Towers', 'Allen & Unwin'),
		('The Price of the Phoenix', 'Bantam Books'),
		('Jitterbug Perfume', 'Bantam Books'),
		('Gravy Planet', 'Ballantine Books'),
		('Fahrenheit 451', 'Ballantine Books'),
		('Silent Night', 'Penguin Random House'),
		('Wild Country', 'Penguin Random House'),
		('The Lost Tribe', 'Tor Books'),
		('The Canal House', 'Tor Books'),
		('An American Dream', 'Dial Press'),
		('Mile High', 'Dial Press'),
		('Still Bleeding', 'Orion Publishing Group'),
		('The Silent Patient', 'Orion Publishing Group')
	;
	SELECT * FROM tbl_Books;
	
	INSERT INTO tbl_Authors
		(BookId, AuthorName)
		VALUES
		(1, 'Stephen King'),
		(2, 'Stephen King'),
		(3, 'James S A Corey'),
		(4,'James S A Corey'),
		(5, 'Geroge R R Martin'),
		(6, 'George R R Martin'),
		(7, 'JRR Tolkien'),
		(8, 'JRR Tolkien'),
		(9, 'Myrna Culbreath'),
		(10, 'Tom Robbins'),
		(11, 'Fredrick Pohl'),
		(12, 'Ray Bradbury'),
		(13, 'Danielle Steele'),
		(14, 'Anne Bishop'),
		(15, 'Mark Lee'),
		(16, 'Mark Lee'),
		(17, 'Norman Mailer'),
		(18, 'Richard Condon'),
		(19, 'Steve Mosby'),
		(20, 'Alex Michaelides')	
	;	
	SELECT * FROM tbl_Authors;	
	

	INSERT INTO tbl_Copies
		(BookID, BranchID, NumberCopies)
		VALUES
		
		(1, 1, 3),
		(2, 1, 3),	
		(3, 1, 3),
		(4, 1, 3),
		(5, 1, 3),
		(6, 1, 3),
		(7, 1, 3),
		(8, 1, 3),
		(9, 1, 3),
		(10, 1, 3),
		(11, 1, 3),
		(12, 1, 3),
		(13, 1, 3),
		(14, 1, 3),
		(15, 1, 3),
		(16, 1, 3),
		(17, 1, 3),
		(18, 1, 3),
		(19, 1, 3),
		(20, 1, 3),

		(1, 2, 3),
		(2, 2, 3),	
		(3, 2, 3),
		(4, 2, 3),
		(5, 2, 3),
		(6, 2, 3),
		(7, 2, 3),
		(8, 2, 3),
		(9, 2, 3),
		(10, 2, 3),
		(11, 2, 3),
		(12, 2, 3),
		(13, 2, 3),
		(14, 2, 3),
		(15, 2, 3),
		(16, 2, 3),
		(17, 2, 3),
		(18, 2, 3),
		(19, 2, 3),
		(20, 2, 3),

		(1, 3, 3),
		(2, 3, 3),	
		(3, 3, 3),
		(4, 3, 3),
		(5, 3, 3),
		(6, 3, 3),
		(7, 3, 3),
		(8, 3, 3),
		(9, 3, 3),
		(10, 3, 3),
		(11, 3, 3),
		(12, 3, 3),
		(13, 3, 3),
		(14, 3, 3),
		(15, 3, 3),
		(16, 3, 3),
		(17, 3, 3),
		(18, 3, 3),
		(19, 3, 3),
		(20, 3, 3),

		(1, 4, 3),
		(2, 4, 3),	
		(3, 4, 3),
		(4, 4, 3),
		(5, 4, 3),
		(6, 4, 3),
		(7, 4, 3),
		(8, 4, 3),
		(9, 4, 3),
		(10, 4, 3),
		(11, 4, 3),
		(12, 4, 3),
		(13, 4, 3),
		(14, 4, 3),
		(15, 4, 3),
		(16, 4, 3),
		(17, 4, 3),
		(18, 4, 3),
		(19, 4, 3),
		(20, 4, 3),

		(1, 5, 3),
		(2, 5, 3),	
		(3, 5, 3),
		(4, 5, 3),
		(5, 5, 3),
		(6, 5, 3),
		(7, 5, 3),
		(8, 5, 3),
		(9, 5, 3),
		(10, 5, 3),
		(11, 5, 3),
		(12, 5, 3),
		(13, 5, 3),
		(14, 5, 3),
		(15, 5, 3),
		(16, 5, 3),
		(17, 5, 3),
		(18, 5, 3),
		(19, 5, 3),
		(20, 5, 3),

		(1, 6, 3),
		(2, 6, 3),	
		(3, 6, 3),
		(4, 6, 3),
		(5, 6, 3),
		(6, 6, 3),
		(7, 6, 3),
		(8, 6, 3),
		(9, 6, 3),
		(10, 6, 3),
		(11, 6, 3),
		(12, 6, 3),
		(13, 6, 3),
		(14, 6, 3),
		(15, 6, 3),
		(16, 6, 3),
		(17, 6, 3),
		(18, 6, 3),
		(19, 6, 3),
		(20, 6, 3),

		(1, 7, 3),
		(2, 7, 3),	
		(3, 7, 3),
		(4, 7, 3),
		(5, 7, 3),
		(6, 7, 3),
		(7, 7, 3),
		(8, 7, 3),
		(9, 7, 3),
		(10, 7, 3),

		(11, 8, 3),
		(12, 8, 3),
		(13, 8, 3),
		(14, 8, 3),
		(15, 8, 3),
		(16, 8, 3),
		(17, 8, 3),
		(18, 8, 3),
		(19, 8, 3),
		(20, 8, 3),

		(1, 9, 3),
		(2, 9, 3),	
		(3, 9, 3),
		(4, 9, 3),
		(5, 9, 3),
		(6, 9, 3),
		(7, 9, 3),
		(8, 9, 3),
		(9, 9, 3),
		(10, 9, 3),

		(11, 10, 3),
		(12, 10, 3),
		(13, 10, 3),
		(14, 10, 3),
		(15, 10, 3),
		(16, 10, 3),
		(17, 10, 3),
		(18, 10, 3),
		(19, 10, 3),
		(20, 10, 3),

		(1, 11, 3),
		(2, 11, 3),	
		(3, 11, 3),
		(4, 11, 3),
		(5, 11, 3),
		(6, 11, 3),
		(7, 11, 3),
		(8, 11, 3),
		(9, 11, 3),
		(10, 11, 3),

		(11, 12, 3),
		(12, 12, 3),
		(13, 12, 3),
		(14, 12, 3),
		(15, 12, 3),
		(16, 12, 3),
		(17, 12, 3),
		(18, 12, 3),
		(19, 12, 3),
		(20, 12, 3),

		(1, 13, 3),
		(2, 13, 3),	
		(3, 13, 3),
		(4, 13, 3),
		(5, 13, 3),
		(6, 13, 3),
		(7, 13, 3),
		(8, 13, 3),
		(9, 13, 3),
		(10, 13, 3),

		(11, 14, 3),
		(12, 14, 3),
		(13, 14, 3),
		(14, 14, 3),
		(15, 14, 3),
		(16, 14, 3),
		(17, 14, 3),
		(18, 14, 3),
		(19, 14, 3),
		(20, 14, 3),

		(1, 15, 3),
		(2, 15, 3),	
		(3, 15, 3),
		(4, 15, 3),
		(5, 15, 3),
		(6, 15, 3),
		(7, 15, 3),
		(8, 15, 3),
		(9, 15, 3),
		(10, 15, 3),

		(11, 16, 3),
		(12, 16, 3),
		(13, 16, 3),
		(14, 16, 3),
		(15, 16, 3),
		(16, 16, 3),
		(17, 16, 3),
		(18, 16, 3),
		(19, 16, 3),
		(20, 16, 3),

		(1, 17, 3),
		(2, 17, 3),	
		(3, 17, 3),
		(4, 17, 3),
		(5, 17, 3),
		(6, 17, 3),
		(7, 17, 3),
		(8, 17, 3),
		(9, 17, 3),
		(10, 17, 3),

		(11, 18, 3),
		(12, 18, 3),
		(13, 18, 3),
		(14, 18, 3),
		(15, 18, 3),
		(16, 18, 3),
		(17, 18, 3),
		(18, 18, 3),
		(19, 18, 3),
		(20, 18, 3),

		(1, 19, 3),
		(2, 19, 3),	
		(3, 19, 3),
		(4, 19, 3),
		(5, 19, 3),
		(6, 19, 3),
		(7, 19, 3),
		(8, 19, 3),
		(9, 19, 3),
		(10, 19, 3),

		(11, 20, 3),
		(12, 20, 3),
		(13, 20, 3),
		(14, 20, 3),
		(15, 20, 3),
		(16, 20, 3),
		(17, 20, 3),
		(18, 20, 3),
		(19, 20, 3),
		(20, 20, 3)
	;
	SELECT * FROM tbl_Copies;

	INSERT INTO tbl_Borrower
		(Name, Address, Phone)
		VALUES
		('Julie Lang', 'Main St','555-123-7777'),
		('Steve Miller', 'Bird Lane', '555-156-0000'),
		('Nancy Jane', 'Hazel Street', '918-876-9090'),
		('Will Smith', 'Gold Road', '555-453-7654'),
		('Tracy Darrow', 'Paradise Way', '767-897-7777'),
		('Isaac Franklin', 'Powell Valley Rd', '503-570-8888'),
		('Billie Hall', 'Trulia Street', '450-555-1676'),
		('Celeste Marie', 'Kitten St', '777-909-7654'),
		('Hank Ford', 'Mustang Drive', '555-676-5555'),
		('Maisey Lane', 'Starship Drive', '567-908-5432'),
		('Harrison Gray', 'Mt Hood Rd', '777-456-0909')
	;
	SELECT * FROM tbl_Borrower;

	INSERT INTO tbl_Loans
		(BookId, BranchId, CardNo, DateOut, DateDue)
		Values
		(1 , 1, 1, '03-18-2019', '04-01-2019'),
		(3, 1, 1, '03-08-2019', '03-22-2019'),
		(5, 1, 1, '03-07-2019', '03-21-2019'),
		(7, 1, 1, '03-18-2019', '04-01-2019'),
		(8, 1, 1, '03-18-2019', '04-01-2019'),
		(9, 1, 1, '03-07-2019', '03-21-2019'),
		(11, 1, 1, '03-18-2019', '04-01-2019'),
		(13, 1, 1, '03-18-2019', '04-01-2019'),
		(16, 1, 1, '03-18-2019', '04-01-2019'),
		(17, 1, 1, '03-18-2019', '04-01-2019'),

		(2, 6, 2, '03-18-2019', '04-01-2019'),
		(4, 6, 2, '03-18-2019', '04-01-2019'),
		(7, 6, 2, '03-18-2019', '04-01-2019'),
		(14, 6, 2, '03-18-2019', '04-01-2019'),

		(9, 4, 3, '03-18-2019', '04-01-2019'),
		(11, 4, 3, '03-8-2019', '03-22-2019'),
		(15, 4, 3, '03-18-2019', '04-01-2019'),
		(17, 4, 3, '03-18-2019', '04-01-2019'),

		(1, 2, 4, '03-18-2019', '04-01-2019'),
		(7, 2, 4, '03-18-2019', '04-01-2019'),
		(9, 2, 4, '03-07-2019', '03-21-2019'),
		(19, 2, 4, '03-18-2019', '04-01-2019'),
		(20, 2, 4, '03-18-2019', '04-01-2019'),

		(5, 3, 5, '03-18-2019', '04-01-2019'),
		(7, 3, 5, '03-18-2019', '04-01-2019'),
		(9, 3, 5, '03-18-2019', '04-01-2019'),
		(10, 3, 5, '03-18-2019', '04-01-2019'),
		(11, 3, 5, '03-18-2019', '04-01-2019'),
		(12, 3, 5, '03-18-2019', '04-01-2019'),
		(13, 3, 5, '03-08-2019', '03-22-2019'),
		(16, 3, 5, '03-18-2019', '04-01-2019'),
		(18, 3, 5, '03-18-2019', '04-01-2019'),
		(20, 3, 5, '03-18-2019', '04-01-2019'),

		(2, 3, 6, '03-18-2019', '04-01-2019'),
		(5, 3, 6, '03-18-2019', '04-01-2019'),
		(6, 3, 6, '03-18-2019', '04-01-2019'),

		(10, 4, 7, '03-18-2019', '04-01-2019'),
		(17, 4, 7, '03-18-2019', '04-01-2019'),
		(19, 4, 7, '03-18-2019', '04-01-2019'),
		(20, 4, 7, '03-18-2019', '04-01-2019'),

		(15, 5, 8, '03-18-2019', '04-01-2019'),
		(16, 5, 8, '03-18-2019', '04-01-2019'),
		(17, 5, 8, '03-18-2019', '04-01-2019'),
		(19, 5, 8, '03-18-2019', '04-01-2019'),
		(20, 5, 8, '03-18-2019', '04-01-2019'),

		(2, 6, 9, '03-18-2019', '04-01-2019'),
		(6, 6, 9, '03-18-2019', '04-01-2019'),
		(8, 6, 9, '03-18-2019', '04-01-2019'),
		(11, 6, 9, '03-18-2019', '04-01-2019'),
		(19, 6, 9, '03-18-2019', '04-01-2019')	
	;
	SELECT * FROM tbl_Loans;

	--How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?--
	
	SELECT * FROM tbl_Library_Branch;
	SELECT * FROM tbl_Publisher;
	SELECT * FROM tbl_Books;
	SELECT * FROM tbl_Authors;
	SELECT * FROM tbl_Copies;
	SELECT * FROM tbl_Loans;
	SELECT * FROM tbl_Borrower;

	USE db_Library;


	SELECT * FROM tbl_Books;
	SELECT * FROM tbl_Authors;
	

	USE db_Library


	SELECT * 
	FROM tbl_Books 
	INNER JOIN tbl_Authors
	ON tbl_Books.BookId = tbl_Authors.BookId;



	-- inner join title and author --
	SELECT Title, AuthorName AS 'Author'
	FROM tbl_Books 
	INNER JOIN tbl_Authors
	ON tbl_Authors.BookId = tbl_Books.BookId;


	-- inner join branch / Copies / Title
	SELECT * FROM tbl_Copies
	SELECT * FROM tbl_Library_Branch
	SELECT * FROM tbl_Books

	SELECT BranchName AS 'Branch',  NumberCopies AS 'Copies', Title AS 'Title'
	FROM tbl_Library_Branch
	INNER JOIN tbl_Books
	ON tbl_Library_Branch.BranchID = tbl_Books.BookId
	INNER JOIN tbl_Copies
	ON tbl_Library_Branch.BranchID = tbl_Copies.BookId;
	
	
	
	SELECT * FROM tbl_Books;
	SELECT * FROM tbl_Authors;
	SELECT * FROM tbl_Copies;

	SELECT BookTitle, AuthorName AS 'Author', Number_Of_Copies AS 'Copies'
	FROM tbl_Books
	INNER JOIN tbl_Copies
	ON tbl_Copies.BookId = tbl_Books.BookId
	INNER JOIN tbl_Authors
	ON tbl_Authors.BookId = tbl_Books.BookId;

	

	USE db_Library
		GO
		CREATE PROCEDURE dbo.GetTitle @BookTitle nvarchar(30)
		AS
		SELECT *
		FROM tbl_Books
		WHERE BookTitle = ISNULL(@BookTitle,BookTitle)
		GO

		EXEC dbo.GetTitle @BookTitle = 'The Lost Tribe'


/* How many copies of the book titled "The Lost Tribe" 
are owned by the library branch whose name is "Sharpstown"?
*/

CREATE PROCEDURE dbo.BookandBranch @Title varchar(30) = NULL, @BranchName varchar(30) = NULL
AS
SELECT Title, NumberCopies AS 'Copies Owned' , BranchName AS 'Branch'
FROM tbl_Books
INNER JOIN tbl_Copies
ON tbl_Books.BookId = tbl_Copies.BookId
INNER JOIN tbl_Library_Branch
ON tbl_Copies.BranchId = tbl_Library_Branch.BranchId
WHERE Title = ISNULL(@Title,Title)
AND BranchName = ISNULL(@BranchName,BranchName)
GO

/* How many copies of the book titled 
"The Lost Tribe" are owned by each library branch?
*/

EXEC dbo.BookandBranch @Title = 'The Lost Tribe', @BranchName = 'Sharpstown'

CREATE PROCEDURE dbo.TotalCopies @Title nvarchar(30) = NULL
AS
SELECT Title, BranchName AS 'Branch', NumberCopies AS 'Copies Per Branch'
FROM tbl_Books
INNER JOIN tbl_Copies
ON tbl_Books.BookId = tbl_Copies.BookId
INNER JOIN tbl_Library_Branch
ON tbl_Copies.BranchId = tbl_Library_Branch.BranchId
WHERE Title = ISNULL(@Title,Title)
GO

EXEC dbo.TotalCopies @Title = 'The Lost Tribe'

/* Retrieve the names of all borrowers 
who do not have any books checked out.
*/

SELECT Name, tbl_Borrower.CardNo, BookId 
FROM tbl_Borrower
LEFT OUTER JOIN tbl_Loans
ON tbl_Borrower.CardNo = tbl_Loans.CardNo
WHERE BookId is NULL

/*
For each book that is loaned out from 
the "Sharpstown" branch and whose DueDate is today,
 retrieve the book title, the borrower's name, 
 and the borrower's address.
 */

CREATE PROCEDURE dbo.GetInfoDateDue @DateDue DATE, @BranchId INT = NULL
AS
SELECT Title, Name, Address, DateDue
FROM tbl_Books
INNER JOIN tbl_Loans
ON tbl_Books.BookId = tbl_Loans.BookId
INNER JOIN tbl_Borrower
ON tbl_Loans.CardNo = tbl_Borrower.CardNo

WHERE DateDue = @DateDue
AND BranchId = @BranchID
GO

EXEC dbo.GetInfoDateDue @DateDue = '03-22-2019', @BranchId = 3

/*
For each library branch, retrieve the branch name 
and the total number of books loaned out from that branch.
*/

SELECT COUNT(tbl_Loans.BookId) AS 'Total Books Checked Out', BranchName
FROM tbl_Loans
INNER JOIN tbl_Books
ON tbl_Loans.BookId = tbl_Books.BookId
INNER JOIN tbl_Library_Branch
ON tbl_Loans.BranchId = tbl_Library_Branch.BranchId
GROUP BY BranchName

/*  Retrieve the names, addresses, 
and the number of books checked out for 
all borrowers who have more than 
five books checked out.
*/

SELECT COUNT(Name) AS 'Book Count', Address, Phone, Name
FROM tbl_Borrower
INNER JOIN tbl_Loans
ON tbl_Borrower.CardNo = tbl_Loans.CardNo
GROUP BY Address, Phone, Name
HAVING COUNT(Name) > 5

/* 
For each book authored (or co-authored) by "Stephen King", 
retrieve the title and the number of copies owned by the 
library branch whose name is "Central".
*/

CREATE PROCEDURE dbo.AuthorBranch @Authorname varchar(30) = NULL, @BranchName varchar(30) = NULL
AS
SELECT AuthorName AS 'Author', Title, NumberCopies AS 'Copies', BranchName AS 'Branch'
FROM tbl_Authors
INNER JOIN tbl_Books
ON tbl_Authors.BookId = tbl_Books.BookId
INNER JOIN tbl_Copies
ON tbl_Books.BookId = tbl_Copies.BookId
INNER JOIN tbl_Library_Branch
ON tbl_Copies.BranchId = tbl_Library_Branch.BranchId
WHERE AuthorName = ISNULL(@AuthorName,AuthorName)
AND BranchName = ISNULL(@BranchName,BranchName)
GO

EXEC dbo.AuthorBranch @Authorname = 'Stephen King', @BranchName = 'Central'




 




