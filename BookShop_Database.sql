CREATE DATABASE book_Shop;
USE book_Shop;
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150),
    author_fname VARCHAR(150),
    author_lname VARCHAR(150),
    released_year INT,
    pages INT NOT NULL,
    nobel_prize VARCHAR(3) NOT NULL, 
    observations VARCHAR(50),        
    book_language VARCHAR(50) NOT NULL      
);
SELECT * FROM books;
SELECT CONCAT(author_fname, author_lname) FROM books;
SELECT CONCAT(author_fname, ' ', author_lname) FROM books;
SELECT CONCAT_WS(' ', author_fname, author_lname) FROM books;
SELECT * FROM books;
SELECT CONCAT_WS(' ', author_fname, author_lname, title, released_year, book_language)AS Book FROM books;
SELECT * FROM books;
SELECT CONCAT_WS(' ', author_lname, nobel_prize) AS Nobel_Prize FROM books;
SELECT CONCAT_WS(' ', book_id, author_fname, author_lname) AS Author FROM books;
SELECT * FROM books;
SELECT SUBSTRING(author_fname, 1, 4), author_fname AS initials FROM books;
SELECT * FROM books;
SELECT CONCAT_WS(' ', book_id, author_fname, CONCAT(SUBSTRING(author_lname, 1, 1), '.')) AS Author FROM books;
SELECT CONCAT(book_id, ' ', author_fname, ' ', SUBSTRING(author_lname, 1, 1), '.') AS Author FROM books;
SELECT author_fname, author_lname, CONCAT(SUBSTRING(author_fname, 1,1), '.', ' ', SUBSTRING(author_lname, 1,1), '.') AS Author_Initials FROM books;
SELECT * FROM books;
SELECT REPLACE (title, ' ', '-') FROM books;
SELECT * FROM books;
SELECT REVERSE (author_fname) FROM books;
SELECT REVERSE(CONCAT(author_fname, ' ', author_lname)) AS reverse_authrnames FROM books;
SELECT CHAR_LENGTH(title) AS len, title FROM books ORDER BY len desc;
SELECT title FROM books WHERE title = 'One Hundred Years of Solitude';
SELECT CHAR_LENGTH(title) FROM books WHERE title = 'One Hundred Years of Solitude';
SELECT * FROM books;
SELECT CONCAT('I love the book', ' ', UPPER(title), UPPER('!!!')) AS my_favorite_book FROM books WHERE book_Id = 456;
SELECT INSERT(author_fname, 6, 1, 't is amazing!') AS my_Opinion FROM books WHERE author_fname = 'Ernest';
SELECT CONCAT(LEFT(author_fname, 1), '.') AS Author_Initials FROM books;
SELECT * FROM books;
SELECT REPEAT(author_fname, 2) AS Nobel_Prize_Winner FROM books WHERE nobel_prize = 'Yes';
SELECT author_fname FROM books WHERE author_fname = 'Gabriel';
UPDATE books SET author_fname = 'Gabriel..' WHERE author_fname = 'Gabriel'; 
SELECT author_fname FROM books WHERE author_fname = 'Gabriel..';
SELECT TRIM(TRAILING '..'FROM author_fname) FROM books WHERE author_fname = 'Gabriel..';
UPDATE books SET author_fname = 'Gabriel' WHERE author_fname = 'Gabriel..';
SELECT author_fname, author_lname AS colombian_writer FROM books WHERE author_fname = 'Gabriel';