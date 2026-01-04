-- Seleccionar la base de datos
USE book_shop;

-- Crear la tabla de hechos para las ventas
CREATE TABLE IF NOT EXISTS book_sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_title VARCHAR(255),
    sales_year INT,
    units_sold INT,
    -- Creamos un índice para que las consultas de análisis sean más rápidas
    INDEX (book_title) 
);
INSERT INTO book_sales (book_title, sales_year, units_sold)
SELECT 
    b.title, 
    years.y,
    -- Lógica de negocio para generar datos realistas
    FLOOR(
        CASE 
            WHEN b.nobel_prize = 'Yes' THEN (50000 + RAND() * 150000)
            WHEN b.book_language = 'English' THEN (30000 + RAND() * 200000)
            WHEN b.pages > 500 THEN (20000 + RAND() * 100000)
            ELSE (5000 + RAND() * 50000)
        END * -- Ajuste por año (simulando tendencias de mercado)
        CASE 
            WHEN years.y = 2020 THEN 1.3 -- Pico por pandemia
            WHEN years.y = 2024 THEN 1.1 -- Recuperación económica
            ELSE 1.0 
        END
    ) as units
FROM books b
CROSS JOIN (
    SELECT 2020 AS y UNION SELECT 2021 UNION SELECT 2022 
    UNION SELECT 2023 UNION SELECT 2024 UNION SELECT 2025
) AS years;
SELECT 
    book_title, 
    SUM(units_sold) as total_unidades
FROM book_sales
GROUP BY book_title
ORDER BY total_unidades DESC
LIMIT 100;
