USE book_shop;
DESCRIBE  book_sales;
------------------------------------------------------------------------------------
DESCRIBE books;
------------------------------------------------------------------------------------
SELECT 
    *
FROM
    book_sales;
------------------------------------------------------------------------------------
SELECT 
    *
FROM
    books;
------------------------------------------------------------------------------------
SELECT 
    CONCAT(title, ' - ', LEFT(author_fname, 1), '. ', author_lname) AS book_info, 
    SUM(units_sold) AS total_sales,
    sales_year
FROM books 
JOIN book_sales ON books.book_id = book_sales.id 
WHERE (author_lname LIKE '%Garcia Marquez%' 
   OR author_lname = 'Hemingway' 
   OR author_lname = 'Oe'
   OR author_lname = 'Amado')
  AND sales_year = 2024
GROUP BY title, author_fname, author_lname
ORDER BY total_sales DESC;
------------------------------------------------------------------------------------
SELECT DISTINCT
    CONCAT(author_fname, ' ', author_lname)
AS 
	author_fullname
FROM
    books
WHERE
    author_fname = 'William';
------------------------------------------------------------------------------------
SELECT DISTINCT
    released_year
FROM
    books
ORDER BY released_year DESC;
------------------------------------------------------------------------------------
SELECT DISTINCT
    CONCAT(author_fname, ' ', author_lname)
AS authors,
    nobel_prize
AS nobel_prize_winners
FROM
    books
WHERE
    nobel_prize 
LIKE '%Yes%'
ORDER BY 
	nobel_prize DESC;
------------------------------------------------------------------------------------
SELECT DISTINCT
	title, released_year
FROM
	books
ORDER BY
	released_year DESC;
------------------------------------------------------------------------------------
DESC books;
SELECT 
    title AS book,
    CONCAT(LEFT(author_fname, 1),
            '.',
            ' ',
            author_lname) AS author,
    pages
FROM
    books
WHERE
    nobel_prize = 'Yes'
ORDER BY pages ASC;
------------------------------------------------------------------------------------
SELECT DISTINCT
    title AS Book,
    CONCAT(LEFT(author_fname, 1),
            '.',
            ' ',
            author_lname) AS Author,
    released_year AS Released_Year
FROM
    books
ORDER BY released_year DESC;
------------------------------------------------------------------------------------
SELECT 
    title AS Books,
    CONCAT(LEFT(author_fname, 1),
            '.',
            ' ',
            author_lname) AS Author,
    released_year AS Released_Year,
    sales_year AS Sales_Year,
    units_sold AS Units_Sold
FROM
    books
        JOIN
    book_sales ON books.book_id = book_sales.id
ORDER BY author_fname , units_sold DESC;
------------------------------------------------------------------------------------
SELECT 
    title AS Title,
    author_fname,
    author_lname AS Author,
    units_sold AS Units
FROM
    books
        JOIN
    book_sales ON books.book_id = book_sales.id
ORDER BY units_sold DESC
LIMIT 10;
------------------------------------------------------------------------------------