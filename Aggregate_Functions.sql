USE book_shop;
SELECT 
    COUNT(*)
FROM
    books;
--------------------------------------------------
SELECT 
    COUNT(DISTINCT (author_fname))
FROM
    books;
--------------------------------------------------
SELECT 
	COUNT(DISTINCT (released_year))
FROM
    books
ORDER BY released_year DESC;
--------------------------------------------------
SELECT 
    released_year, 
    COUNT(*) AS total_books_released
FROM 
    books 
GROUP BY 
    released_year
ORDER BY 
    released_year DESC;
--------------------------------------------------
