-- 1. Subquery di dalam FROM keyword
SELECT * 
FROM (
    SELECT * FROM students AS S
    WHERE S.id > 9
) As Data;

-- 2. Subquery di dalam WHERE Clause
SELECT * FROM products
WHERE price = (
    SELECT MAX(price) FROM products
);