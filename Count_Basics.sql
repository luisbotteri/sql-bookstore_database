-- Functions used in this exercise: GROUP BY, COUNT, SUM, MAX & MIN and AVG.
-- Funciones utilizadas en este ejercicio: GROUP BY, COUNT, SUM, MAX & MIN and AVG.
USE book_shop;

-- Counts distinct books per author, sorted by total descending.
-- Cuenta libros únicos por autor, ordenados de mayor a menor cantidad.
SELECT 
	CONCAT(author_fname, ' ', author_lname) AS Author,
	COUNT(DISTINCT(title)) AS Total_Books
FROM
    books
GROUP BY Author
ORDER BY Total_Books DESC;

-- Count the total number of pages written and the average per author.
-- Cuenta la cantidad total de páginas escritas y su promedio por autor.
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS Author,
    SUM(pages) AS Total_Pages_By_Author,
    AVG(pages) AS Average_Pages_Written
FROM
    books
GROUP BY Author
ORDER BY Total_Pages_By_Author DESC;

-- Shows the minimum number of pages written by an author and the year they were written.
-- Muestra la cantidad mínima de páginas escritas por autor y el año en que fueron escritas.
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS Author,
    MIN(pages) AS Min_Pages,
    MAX(released_year) AS Last_Active_Year
FROM
    books
GROUP BY Author
ORDER BY Min_Pages DESC;