CREATE DATABASE library_db;

-- Libraray Management Table
USE library_db;
-- Creating Branch Table
CREATE TABLE Branch(
 branch_id	VARCHAR(10) PRIMARY KEY,
 manager_id	VARCHAR(10),
 branch_address VARCHAR(50),
 contact_no VARCHAR(10)

);
-- Create table "Employee"
DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
	emp_id VARCHAR(10) PRIMARY KEY,
	emp_name VARCHAR(30),
	position VARCHAR(30),
	salary DECIMAL(10,2),
	branch_id VARCHAR(10) -- FK-----
);
-- Create table "Books"
DROP TABLE IF EXISTS books;
CREATE TABLE books
(
            isbn VARCHAR(50) PRIMARY KEY,
            book_title VARCHAR(80),
            category VARCHAR(30),
            rental_price FLOAT,
            status VARCHAR(10),
            author VARCHAR(30),
            publisher VARCHAR(30)
);
-- Create table "members"
DROP TABLE IF EXISTS menbers;
CREATE TABLE members
(
    member_id VARCHAR(10) PRIMARY KEY,
	member_name	VARCHAR(20),
    member_address VARCHAR(55),
	reg_date date
);
-- Create table "issued_status"
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
(
   issued_id VARCHAR(10) PRIMARY KEY,	
   issued_member_id VARCHAR(10), -- FK---
   issued_book_name VARCHAR(75),
   issued_date DATE,
   issued_book_isbn VARCHAR(25),-- FK----
   issued_emp_id VARCHAR(10) -- FK----

);

-- Create table "return_status"
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status (
return_id VARCHAR(10) PRIMARY KEY,
	issued_id VARCHAR(10), -- FK---
	return_book_name VARCHAR(75),
	return_date DATE,
	return_book_isbn VARCHAR(25) -- FK

);

-- FOREIGN KEY
ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id) 
REFERENCES branch(branch_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_books_isbn
FOREIGN KEY (return_book_isbn)
REFERENCES books(isbn);


