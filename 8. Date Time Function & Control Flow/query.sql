-- Dalam MySQL terdapat banyak Function untuk melakukan manupulasi date

SELECT
id,
name,
-- Untuk mengekstrak tahun dari sebuah kolom date
EXTRACT(YEAR FROM created_at) AS Year,

-- Untuk mengekstrak bulan dari sebuah kolom date
EXTRACT(MONTH FROM created_at) as Month ,

-- Untuk mencetak tahun dari sebuah kolom date. Cara mudah
YEAR(created_at) AS 'Created Year',

-- Untuk mencetak bulan dari sebuah kolom date. Cara mudah
MONTH(created_at) AS 'Created Month'
FROM products;

-- Control Flow merupakan sebuah function untuk melakukan pengkondisian  di dalam MySQL
-- Namun hanya pengkondisian yg simple, klo yg kompleks better di code bhs program aja

-- 1. Switch Case
SELECT 
id,
CASE category
    WHEN 'Minuman' THEN 'Segar'
    WHEN 'Makanan' THEN 'Enak'
    ELSE 'Apa itu ?'
END AS Category
FROM products;

-- 2. IF Statement
-- Rumus :
-- IF(condition, klo condition nya true maka tampilkan value ini, klo kondisi nya false value ini yg di pakai)
SELECT 
id,
IF(category = 'Minuman', 'Segar', IF(category = 'Makanan', 'Enak', 'Apa itu ?')) As Category
FROM products;

-- 3. IF NULL
SELECT
id,
name,
-- Untuk menampilakn suatu value juga sebuah field itu null
-- rumus : IFNULL(nama field yg mau di cek, value yg akan di tampilkan jika field nya itu  null')
-- Kode dibawah akan ngecek, jika category nya null maka isi value nya dengan string 'Ini Null'
IFNULL(category, 'Ini Null')
FROM products;