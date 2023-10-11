-- Create a database for the library management system
CREATE DATABASE library_management_system;

-- Use the database
USE library_management_system;

-- Create a table for books
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publication_year INT,
    ISBN VARCHAR(13) NOT NULL
);

-- Create a table for library members
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATE
);

-- Create a table for borrowing books
CREATE TABLE book_borrowing (
    borrowing_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    borrow_date DATE,
    due_date DATE,
    return_date DATE
);

-- Create an index on book_id in the book_borrowing table for efficient lookups
CREATE INDEX idx_book_id ON book_borrowing (book_id);

-- Create an index on member_id in the book_borrowing table for efficient lookups
CREATE INDEX idx_member_id ON book_borrowing (member_id);
-- Insert a book into the "books" table
INSERT INTO books (title, author, publication_year, ISBN)
VALUES ('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'ISBN123456789');

-- Insert another book
INSERT INTO books (title, author, publication_year, ISBN)
VALUES ('catch-22', 'Joseph Heller', 1961, 'ISBN987654321');

-- Insert another book
INSERT INTO books (title, author, publication_year, ISBN)
VALUES ('ulysses', 'James joyce', 1922, 'ISBN498371068');

-- Insert another book
INSERT INTO books (title, author, publication_year, ISBN)
VALUES ('Anna Karenina', 'Leo Tolstoy', 1878, 'ISBN753159842');

INSERT INTO books (title, author, publication_year, ISBN)
VALUES ('To Kill a Mockingbird', 'Harper Lee', 1960, 'ISBN492710328');

INSERT INTO books (title, author, publication_year, ISBN)
VALUES ('The God Delusion', 'Richard Dawkins', 2006, 'ISBN532219523');

INSERT INTO books (title, author, publication_year, ISBN)
VALUES ('The Silence of the Girls', 'Pat Barker', 2018, 'ISBN507693549');

INSERT INTO books (title, author, publication_year, ISBN)
VALUES ('Moneyball', 'Michael Lewis', 2010, 'ISBN295815607');

INSERT INTO books (title, author, publication_year, ISBN)
VALUES ('The Corrections', 'Jonathan Franzen', 2001, 'ISBN295492378');

INSERT INTO books (title, author, publication_year, ISBN)
VALUES ('Night Watch', 'Terry Pratchett', 2002, 'ISBN157351573');

-- Insert a member into the "members" table
INSERT INTO members (first_name, last_name, email, registration_date)
VALUES ('John', 'Doe', 'johndoe@yahoo.com', '2023-10-11');

-- Insert another member
INSERT INTO members (first_name, last_name, email, registration_date)
VALUES ('Jane', 'Smith', 'janesmith@hotmail.com', '2023-10-08');

-- Insert a member into the "members" table
INSERT INTO members (first_name, last_name, email, registration_date)
VALUES ('Sam', 'Dove', 'Samdove@gmail.com', '2023-09-11');

-- Insert another member
INSERT INTO members (first_name, last_name, email, registration_date)
VALUES ('may', 'cross', 'maycross@hotmail.com', '2023-09-19');

-- Insert a member into the "members" table
INSERT INTO members (first_name, last_name, email, registration_date)
VALUES ('bayle', 'lawson', 'bayle987@gmail.com', '2023-10-01');

-- Insert another member
INSERT INTO members (first_name, last_name, email, registration_date)
VALUES ('will', 'Smith', 'willsmith@hotmail.com', '2023-10-05');

-- Insert a member into the "members" table
INSERT INTO members (first_name, last_name, email, registration_date)
VALUES ('Alex', 'rogan', 'Aogan@gmail.com', '2023-10-07');

-- Insert another member
INSERT INTO members (first_name, last_name, email, registration_date)
VALUES ('meridith', 'grey', 'grey@gmail.com', '2023-08-05');

-- Insert a member into the "members" table
INSERT INTO members (first_name, last_name, email, registration_date)
VALUES ('Avery', 'John', 'johnA@gmail.com', '2023-05-27');

-- Insert another member
INSERT INTO members (first_name, last_name, email, registration_date)
VALUES ('Kai', 'shelby', 'shelby@gmail.com', '2023-03-28');

-- Insert a record for book borrowing
INSERT INTO book_borrowing (book_id, member_id, borrow_date, due_date)
VALUES (1, 1, '2023-10-11', '2023-11-11');

-- Insert another record for book borrowing
INSERT INTO book_borrowing (book_id, member_id, borrow_date, due_date)
VALUES (2, 2, '2023-10-11', '2023-10-19');

-- Insert a record for book borrowing
INSERT INTO book_borrowing (book_id, member_id, borrow_date, due_date)
VALUES (3, 3, '2023-11-01', '2023-11-07');

-- Insert another record for book borrowing
INSERT INTO book_borrowing (book_id, member_id, borrow_date, due_date)
VALUES (4, 4, '2023-10-20', '2023-11-10');

-- Insert a record for book borrowing
INSERT INTO book_borrowing (book_id, member_id, borrow_date, due_date)
VALUES (5, 5, '2023-10-15', '2023-11-05');

-- Insert another record for book borrowing
INSERT INTO book_borrowing (book_id, member_id, borrow_date, due_date)
VALUES (6, 6, '2023-10-25', '2023-11-07');

-- Insert a record for book borrowing
INSERT INTO book_borrowing (book_id, member_id, borrow_date, due_date)
VALUES (7, 7, '2023-10-03', '2023-10-13');

-- Insert another record for book borrowing
INSERT INTO book_borrowing (book_id, member_id, borrow_date, due_date)
VALUES (8, 8, '2023-10-17', '2023-10-27');

-- Insert a record for book borrowing
INSERT INTO book_borrowing (book_id, member_id, borrow_date, due_date)
VALUES (9, 9, '2023-10-22', '2023-11-02');

-- Insert another record for book borrowing
INSERT INTO book_borrowing (book_id, member_id, borrow_date, due_date)
VALUES (10, 10, '2023-10-21', '2023-11-11');

UPDATE book_borrowing
SET return_date = '2023-10-15'
WHERE borrowing_id = 1;

SELECT b.title AS book_title, m.first_name AS member_first_name, m.last_name AS member_last_name
FROM book_borrowing AS bb
JOIN books AS b ON bb.book_id = b.book_id
JOIN members AS m ON bb.member_id = m.member_id
WHERE bb.return_date IS NULL;
-- embers who have borrowed the most books.
SELECT m.first_name, m.last_name, COUNT(bb.borrowing_id) AS books_borrowed
FROM members AS m
JOIN book_borrowing AS bb ON m.member_id = bb.member_id
GROUP BY m.first_name, m.last_name
ORDER BY books_borrowed DESC;
-- Show a list of books that are currently available (not checked out).
SELECT b.title, b.author
FROM books AS b
WHERE b.book_id NOT IN (SELECT book_id FROM book_borrowing WHERE return_date IS NULL);
--List all books borrowed by a particular member
SELECT b.title, bb.borrow_date, bb.due_date, bb.return_date
FROM books AS b
JOIN book_borrowing AS bb ON b.book_id = bb.book_id
WHERE bb.member_id = 9 ;
-- List members who have overdue books and the details of those books.
SELECT m.first_name, m.last_name, b.title AS book_title, bb.due_date
FROM members AS m
JOIN book_borrowing AS bb ON m.member_id = bb.member_id
JOIN books AS b ON bb.book_id = b.book_id
WHERE bb.return_date IS NULL AND bb.due_date < CURDATE();
-- Calculate the Average Age of Books in the Library:
SELECT AVG(YEAR(NOW()) - publication_year) AS avg_age
FROM books;

DELETE FROM members
WHERE member_id = 2;

