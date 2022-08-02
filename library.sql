CREATE DATABASE library;
USE library;

DROP TABLE IF EXISTS authors;
CREATE TABLE authors (
author_id INT AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(100),
PRIMARY KEY (author_id)
);

DROP TABLE IF EXISTS publisher;
CREATE TABLE publisher (
publisher_id INT AUTO_INCREMENT,
publisher_name VARCHAR(100),
PRIMARY KEY (publisher_id)
);

DROP TABLE IF EXISTS genre;
CREATE TABLE genre (
genre_id INT AUTO_INCREMENT,
genre_name VARCHAR(100),
PRIMARY KEY (genre_id)
);

DROP TABLE IF EXISTS book;
CREATE TABLE book (
book_id INT AUTO_INCREMENT,
title VARCHAR(100),
author_id INT,
publisher_id INT,
genre_id INT,
year_of_publishment INT,
if_borrow BOOL,
PRIMARY KEY (book_id),
FOREIGN KEY (author_id) REFERENCES authors (author_id),
FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
FOREIGN KEY (genre_id) REFERENCES genre (genre_id)
);

DROP TABLE IF EXISTS position;
CREATE TABLE position (
position_id INT AUTO_INCREMENT,
position_name VARCHAR(50),
PRIMARY KEY (position_id)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
employee_id INT AUTO_INCREMENT,
employee_first_name VARCHAR(50),
employee_last_name VARCHAR(100),
position_id INT,
PRIMARY KEY (employee_id),
FOREIGN KEY (position_id) REFERENCES position (position_id)
);

DROP TABLE IF EXISTS borrowers;
CREATE TABLE borrowers (
borrower_id INT AUTO_INCREMENT,
borrower_first_name VARCHAR(50),
borrower_last_name VARCHAR(100),
borrower_address VARCHAR(100),
borrower_number INT,
borrower_email VARCHAR(100),
PRIMARY KEY (borrower_id)
);

DROP TABLE IF EXISTS borrowed_books;
CREATE TABLE borrowed_books (
borrowed_book_id INT AUTO_INCREMENT,
borrower_id INT,
book_id INT,
employee_id INT,
date_of_borrow DATETIME,
date_of_return DATETIME,
PRIMARY KEY (borrowed_book_id),
FOREIGN KEY (borrower_id) REFERENCES borrowers (borrower_id),
FOREIGN KEY (book_id) REFERENCES book (book_id),
FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);

DROP TABLE IF EXISTS employyes;

/*
mistake but stay for future
CREATE USER 'admin1'@'l27.0.0.1' IDENTIFIED BY 'admin1';
GRANT ALL PRIVILEGES ON *.* TO 'admin1'@'127.0.0.1';
FLUSH PRIVILEGES;

select user, host from mysql.user;
drop user 'admin'@'l27.0.0.1';
drop user 'admin1'@'l27.0.0.1';
*/

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin1';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
GRANT GRANT OPTION ON *.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'intern'@'localhost' IDENTIFIED BY 'intern1';
GRANT SELECT ON library.* TO 'intern'@'localhost';
REVOKE SELECT ON library.* FROM 'intern'@'localhost';
GRANT SELECT ON library.book TO 'intern'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'junior'@'localhost' IDENTIFIED BY 'junior1';
GRANT SELECT ON *.* TO 'junior'@'localhost';
GRANT INSERT ON library.book TO 'junior'@'localhost';
GRANT INSERT ON library.borrowed_books TO 'junior'@'localhost';
FLUSH PRIVILEGES;

create user 'senior'@'localhost' IDENTIFIED by 'senior1';
grant select, insert, delete on *.* to 'senior'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'manager'@'localhost' IDENTIFIED by 'manager1';
grant select, insert, delete, drop, update on *.* to 'manager'@'localhost';
FLUSH PRIVILEGES;

select user, host from mysql.user;
show grants for 'admin'@'localhost';
show grants for 'intern'@'localhost';
show grants for 'junior'@'localhost';
show grants for 'senior'@'localhost';
show grants for 'manager'@'localhost';