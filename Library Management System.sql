CREATE DATABASE LibraryManagementSystem

USE LibraryManagementSystem

CREATE TABLE tbl_Book (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	book_title VARCHAR(50) NOT NULL,
	book_publishername VARCHAR(50) NOT NULL CONSTRAINT fk_pub_name FOREIGN KEY REFERENCES tbl_PublisherName(pub_name) ON UPDATE CASCADE ON DELETE CASCADE,
);
INSERT INTO tbl_Book
	(book_title, book_publishername)
	VALUES
	('The Lost Tribe', 'Pearson'),
	('The Da Vinci Code', 'Transworld'),
	('Harry Potter: Book 1', 'Bloomsbury'),
	('Harry Potter: Book 2', 'Bloomsbury'),
	('Harry Potter: Book 3', 'Bloomsbury'),
	('Fifty Shades of Grey', 'Random House'),
	('Harry Potter: Book 4', 'Bloomsbury'),
	('Harry Potter: Book 5', 'Bloomsbury'),
	('Harry Potter: Book 6', 'Bloomsbury'),
	('Angels and Demons', 'Transworld'),
	('Twilight', 'Little Brown Book'),
	('Dragon Tattoo Girl', 'Quercus'),
	('The Lovely Bones', 'Pan Macmillan'),
	('Curious Dog Incident', 'Random House'),
	('Short History of Everything', 'Transworld'),
	('Very Hungry Catapillar', 'Penguin'),
	('Fire Girl', 'Quercus'),
	('The Gruffalo', 'Pan Macmillan'),
	('Jamie''s 30-minute Meals', 'Penguin'),
	('The Kite Runner', 'Bloomsbury')
;
SELECT * FROM tbl_Book

CREATE TABLE tbl_BookAuthors (
	bookauthors_bookid INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_Book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	bookauthors_authorname VARCHAR(50) NOT NULL
);
INSERT INTO tbl_BookAuthors
	(bookauthors_bookid, bookauthors_authorname)
	VALUES
	(22, 'Stephan King'),
	(23, 'Dan Brown'),
	(24, 'J.K. Rowling'),
	(25, 'J.K. Rowling'),
	(26, 'J.K. Rowling'),
	(27, 'E.L. James'),
	(28, 'J.K. Rowling'),
	(29, 'J.K. Rowling'),
	(30, 'J.K. Rowling'),
	(31, 'Dan Brown'),
	(32, 'Stephine Meyer'),
	(33, 'Stieg Larsson'),
	(34, 'Alice Sebold'),
	(35, 'Mark Haddon'),
	(36, 'Bill Bryson'),
	(37, 'Eric Carle'),
	(38, 'Stieg Larsson'),
	(39, 'Julis Donaldson'),
	(40, 'Jamie Oliver'),
	(41, 'Khaled Hosseini')
;
SELECT * FROM tbl_BookAuthors

CREATE TABLE tbl_PublisherName (
	pub_name VARCHAR(50) PRIMARY KEY NOT NULL,
	pub_address VARCHAR(100) NOT NULL,
	pub_phone VARCHAR(12) NOT NULL
);
INSERT INTO tbl_PublisherName
	(pub_name, pub_address, pub_phone)
	VALUES
	('Bloomsbury', 'New York, NY', '212-419-5300'),
	('Little Brown Book', 'New York, NY', '212-364-1100'),
	('Pan Macmillan', 'London, England', '207-014-6000'),
	('Pearson', 'New York, NY', '202-909-4520'),
	('Penguin', 'Dallas, TX', '111-867-5309'),
	('Quercus', 'Portland, OR', '123-867-5309'),
	('Random House', 'Santa Monica, CA', '905-867-5309'),
	('Transworld', 'Miami, FL', '911-867-5309')
;

CREATE TABLE tbl_BookLoans (
	loans_bookid INT NOT NULL CONSTRAINT fk_loans_book_id FOREIGN KEY REFERENCES tbl_Book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	loans_branchid INT NOT NULL CONSTRAINT fk_loans_branch_id FOREIGN KEY REFERENCES tbl_LibraryBranch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	loans_cardno INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_Borrower(borrower_no) ON UPDATE CASCADE ON DELETE CASCADE,
	loans_dateout DATE NOT NULL,
	loans_datedue DATE NOT NULL
);

INSERT INTO tbl_BookLoans
	(loans_bookid,loans_branchid,loans_cardno,loans_dateout,loans_datedue)
	VALUES	
	(22,1,1,'2017-06-14','2017-06-28'),
	(23,1,1,'2017-06-14','2017-06-28'),
	(25,1,1,'2017-06-14','2017-06-28'),
	(28,1,1,'2017-06-21','2017-07-05'),
	(31,1,1,'2017-06-21','2017-07-05'),
	(22,2,2,'2017-06-14','2017-06-28'),
	(24,2,2,'2017-06-14','2017-06-28'),
	(26,2,2,'2017-06-14','2017-06-28'),
	(28,2,2,'2017-06-21','2017-07-05'),
	(31,2,2,'2017-06-21','2017-07-05'),
	(29,3,8,'2017-06-21','2017-07-05'),
	(24,3,7,'2017-06-21','2017-07-05'),
	(36,3,5,'2017-06-21','2017-07-05'),
	(23,4,3,'2017-06-21','2017-07-05'),
	(24,4,5,'2017-06-21','2017-07-05'),
	(40,3,2,'2016-06-21','2016-07-05'),
	(37,2,4,'2015-03-21','2015-04-05'),
	(38,2,5,'2015-06-21','2015-07-05'),
	(39,3,8,'2015-06-21','2015-07-05'),
	(35,4,5,'2016-10-31','2016-11-14'),
	(30,4,1,'2016-02-25','2016-03-09'),
	(31,2,7,'2017-06-21','2017-07-05'),
	(31,2,8,'2017-01-02','2017-01-16'),
	(35,4,6,'2017-05-06','2017-05-20'),
	(41,2,3,'2017-06-21','2017-07-05'),
	(38,1,5,'2017-02-07','2017-02-21'),
	(38,3,2,'2016-06-21','2016-07-05'),
	(22,1,2,'2017-06-21','2017-07-05'),
	(24,2,1,'2017-06-21','2017-07-05'),
	(24,3,6,'2017-06-21','2017-07-05'),
	(29,3,6,'2017-06-21','2017-07-05'),
	(24,2,6,'2017-06-21','2017-07-05'),
	(39,4,2,'2017-05-06','2017-05-20'),
	(37,3,7,'2015-06-21','2015-07-05'),
	(36,1,5,'2015-06-21','2015-07-05'),
	(31,2,2,'2016-03-21','2016-04-05'),
	(39,4,6,'2016-06-21','2016-07-05'),
	(35,4,1,'2016-08-01','2016-09-15'),
	(35,3,7,'2016-08-01','2016-09-15'),
	(40,3,5,'2016-08-01','2016-09-15'),
	(35,4,3,'2016-08-01','2016-09-15'),
	(23,4,3,'2016-08-01','2016-09-15'),
	(24,4,3,'2016-08-01','2016-09-15'),
	(39,4,5,'2017-05-06','2017-05-20'),
	(35,3,6,'2017-05-06','2017-05-20'),
	(28,1,1,'2017-05-06','2017-05-20'),
	(35,3,8,'2017-05-06','2017-05-20'),
	(33,4,7,'2017-05-06','2017-05-20'),
	(41,4,7,'2017-05-06','2017-05-20'),
	(24,3,4,'2017-06-21','2017-07-05')
;
SELECT * FROM tbl_BookLoans

CREATE TABLE tbl_BookCopies (
	copies_bookid INT NOT NULL CONSTRAINT fk_copies_book_id FOREIGN KEY REFERENCES tbl_Book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	copies_branchid INT NOT NULL CONSTRAINT fk_copies_branch_id FOREIGN KEY REFERENCES tbl_LibraryBranch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	copies_units INT NOT NULL
);
INSERT INTO tbl_BookCopies
	(copies_bookid,copies_branchid,copies_units)
	VALUES
	(22, 1, 5),
	(22, 2, 3),
	(22, 3, 7),
	(23, 4, 2),
	(23, 1, 2),
	(24, 2, 8),
	(24, 3, 8),
	(24, 4, 2),
	(25, 1, 5),
	(26, 2, 4),
	(26, 3, 6),
	(27, 4, 89),
	(28, 1, 31),
	(28, 2, 22),
	(29, 3, 8),
	(30, 4, 4),
	(31, 1, 4),
	(31, 2, 7),
	(32, 3, 8),
	(33, 4, 2),
	(34, 1, 6),
	(34, 2, 8),
	(35, 3, 11),
	(35, 4, 66),
	(36, 1, 14),
	(37, 2, 12),
	(37, 3, 7),
	(38, 4, 8),
	(38, 1, 3),
	(38, 2, 5),
	(39, 3, 8),
	(39, 4, 5),
	(39, 1, 16),
	(40, 2, 9),
	(40, 3, 10),
	(40, 4, 8),
	(41, 1, 3),
	(41, 2, 6),
	(41, 3, 8),
	(41, 4, 98)
;
SELECT * FROM tbl_BookCopies

CREATE TABLE tbl_Borrower (
	borrower_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	borrower_fname VARCHAR(50) NOT NULL,
	borrower_lname VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(100) NOT NULL,
	borrower_phone VARCHAR(12) NOT NULL
);
INSERT INTO tbl_Borrower
	(borrower_fname, borrower_lname, borrower_address, borrower_phone)
	VALUES
	('John','Smith','214 SE Faith Lane','231-876-4500'),
	('Rick','Doe','4550 NE Limp Lane','231-321-8900'),
	('Sally','Hope','6223 Tech Circle','231-577-6243'),
	('Ally','Dope','448 Stono Drive','231-555-7878'),
	('Mrs.','Frizzle','662 Magic Bus Lane','231-655-9080'),
	('Bob','Barker','1001 Dollars Lane','231-443-6728'),
	('Mary','Poppins','5589 Spoonful of Sugar Blvd','231-777-5487'),
	('Alex','Dean','2278 Pizza Place','231-000-0000')
;
SELECT * FROM tbl_Borrower

CREATE TABLE tbl_LibraryBranch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(100) NOT NULL
);
INSERT INTO tbl_LibraryBranch
	(branch_name,branch_address)
	VALUES
	('Sharpstown','5151 Broken Dreams Blvd'),
	('Central','4457 Main Street'),
	('Hogwarts', '93/4 Platform Rd'),
	('Prostitution Front', '6969 Shady St')
;
SELECT * FROM tbl_LibraryBranch
DROP PROCEDURE dbo.TheLostTribeCount

CREATE PROCEDURE dbo.TheLostTribeCount @copies_bookid INT = NULL, @copies_branchid INT = NULL
AS
SELECT SUM(copies_units) AS 'The Lost Tribe Copies In Sharpstown:'
FROM tbl_BookCopies
WHERE copies_bookid = ISNULL(@copies_bookid, copies_bookid)
AND copies_branchid = ISNULL(@copies_branchid, copies_branchid)

EXECUTE dbo.TheLostTribeCount @copies_bookid = 22, @copies_branchid = 1

SELECT SUM(copies_units) AS 'The Lost Tribe Copies In Entire Library Database'
FROM tbl_BookCopies
WHERE copies_bookid = 22


SELECT DISTINCT b.borrower_fname,b.borrower_lname
FROM tbl_BookLoans a INNER JOIN tbl_Borrower b ON a.loans_cardno = b.borrower_no
WHERE loans_dateout <= '2017-06-23' 
AND loans_datedue >= '2017-06-23'

SELECT c.book_title, b.borrower_fname, b.borrower_lname, b.borrower_address
FROM tbl_BookLoans a INNER JOIN tbl_Borrower b ON a.loans_cardno = b.borrower_no INNER JOIN tbl_Book c ON a.loans_bookid = c.book_id
WHERE loans_datedue = '2017-06-23' 
AND loans_branchid = 1 

SELECT b.branch_name, count(branch_name) as count
FROM tbl_BookLoans a INNER JOIN tbl_LibraryBranch b ON a.loans_branchid = b.branch_id 
WHERE loans_datedue >= '2017-06-23' GROUP BY branch_name 

SELECT  b.borrower_fname, b.borrower_lname, b.borrower_address, COUNT(loans_cardno)
FROM tbl_BookLoans a INNER JOIN tbl_Borrower b ON a.loans_cardno = b.borrower_no
WHERE loans_datedue >= '2017-06-23'  GROUP BY borrower_fname, borrower_lname, borrower_address HAVING COUNT(loans_cardno) >= 5


SELECT  b.book_title, c.copies_units
FROM tbl_BookAuthors a INNER JOIN tbl_Book b ON a.bookauthors_bookid = b.book_id INNER JOIN tbl_BookCopies c ON b.book_id = c.copies_bookid
WHERE a.bookauthors_authorname = 'Stephen King'
AND c.copies_branchid = 2

