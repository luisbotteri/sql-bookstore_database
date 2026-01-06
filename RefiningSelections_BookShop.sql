USE book_shop;
DESCRIBE  book_sales;
------------------------------------------------------------------------------------
-- EN: Selects the database and displays the structure/schema of the 'book_sales' table.
-- ES: Selecciona la base de datos y muestra la estructura/esquema de la tabla 'book_sales'.

DESCRIBE books;
------------------------------------------------------------------------------------
-- EN: Displays the schema of the 'books' table, including data types and constraints.
-- ES: Muestra el esquema de la tabla 'books', incluyendo tipos de datos y restricciones.
------------------------------------------------------------------------------------
SELECT 
    *
FROM
    book_sales;
------------------------------------------------------------------------------------
-- EN: Retrieves all raw data from the 'book_sales' table for initial verification.
-- ES: Recupera todos los datos crudos de la tabla 'book_sales' para verificación inicial.
------------------------------------------------------------------------------------
SELECT 
    *
FROM
    books;
------------------------------------------------------------------------------------
-- EN: Retrieves all records from the 'books' table to explore the complete catalog.
-- ES: Recupera todos los registros de la tabla 'books' para explorar el catálogo completo.
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
-- EN: Complex JOIN that calculates total sales for 2024 for specific authors, formatting titles and sorting by performance.
-- ES: JOIN complejo que calcula las ventas totales de 2024 para autores específicos, formateando títulos y ordenando por rendimiento.
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
-- EN: Lists unique full names of authors whose first name is 'William'.
-- ES: Lista los nombres completos únicos de los autores cuyo nombre de pila es 'William'.
------------------------------------------------------------------------------------
SELECT DISTINCT
    released_year
FROM
    books
ORDER BY released_year DESC;
------------------------------------------------------------------------------------
-- EN: Generates a unique list of publication years, sorted from newest to oldest.
-- ES: Genera una lista única de años de publicación, ordenados del más reciente al más antiguo.
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
-- EN: Filters and displays unique authors who have won the Nobel Prize.
-- ES: Filtra y muestra los autores únicos que han ganado el Premio Nobel.
------------------------------------------------------------------------------------
SELECT DISTINCT
	title, released_year
FROM
	books
ORDER BY
	released_year DESC;
------------------------------------------------------------------------------------
-- EN: Shows a unique list of titles and their release years, sorted chronologically.
-- ES: Muestra una lista única de títulos y sus años de lanzamiento, ordenados cronológicamente.
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
-- EN: Analyzes Nobel winners' books by length, sorting them by page count in ascending order.
-- ES: Analiza los libros de ganadores del Nobel por extensión, ordenándolos por número de páginas de forma ascendente.
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
-- EN: Creates a clean report of books and authors, prioritized by the most recent release dates.
-- ES: Crea un reporte limpio de libros y autores, priorizado por las fechas de lanzamiento más recientes.
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
-- EN: Detailed sales report per book, sorted alphabetically by author and then by highest sales volume.
-- ES: Reporte detallado de ventas por libro, ordenado alfabéticamente por autor y luego por mayor volumen de ventas.
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
-- EN: Top 10 Best Sellers report, identifying the books with the highest units sold.
-- ES: Reporte de los 10 más vendidos, identificando los libros con las mayores unidades vendidas.
------------------------------------------------------------------------------------
SELECT 
    title AS Book, 
    CONCAT_WS(' ', author_fname, author_lname) AS Author
FROM
    books
WHERE
    title LIKE '%old%';
------------------------------------------------------------------------------------
-- EN: Search query to find any book title containing the word "old".
-- ES: Consulta de búsqueda para encontrar cualquier título de libro que contenga la palabra "old".
------------------------------------------------------------------------------------
SELECT
	title AS Book, 
    CONCAT_WS(' ', author_fname, author_lname) AS Author,
    observations AS Observations,
    book_language AS Language
FROM 
	books
WHERE
	title LIKE '______'
ORDER BY title DESC
LIMIT 10;
------------------------------------------------------------------------------------
-- EN: Advanced filter for books with titles of exactly 6 characters, showing language details and limited to 10 results.
-- ES: Filtro avanzado para libros con títulos de exactamente 6 caracteres, mostrando detalles de idioma y limitado a 10 resultados.
------------------------------------------------------------------------------------