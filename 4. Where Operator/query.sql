-- ================= Where Operator (Operator Perbandingan) =================

-- 1. Operator Sama Dengan (=)
-- Select data products yg price nya adalah 2300
SELECT * FROM products WHERE price = 2300;

-- 2. Operator Tidak Sama dengan (<> atau !=)
SELECT * FROM products WHERE price != 2300;
-- atau
SELECT * FROM products WHERE price <> 2300;

-- 3. Operator Lebih kecil dari (<)
SELECT * FROM products WHERE price < 2500000;

-- 4. Operator Lebih kecil dari sama dengan (<=)
SELECT * FROM products WHERE price <= 2500000;

-- 5. Operator Lebih besar dari (>)
SELECT * FROM products WHERE price > 2500000;

-- 6. Operator Lebih besar dari sama dengan (>=)
SELECT * FROM products WHERE price >= 2500000;


-- ================= Where Operator (Operator Logika) =================

-- 1. AND
SELECT * FROM products WHERE category = 'Makanan' AND price >= 2500000;

-- 2. OR
SELECT * FROM products WHERE category = 'Makanan' OR price > 2500000;

-- ================= Where Operator (Tanda kurung tutup & kurung buka bulat akan selalu di eksekusi pertama kali)
-- By Default di MySQL ketika ada operator AND dan OR berbarengan, maka operator AND akan di eksekusi terlebih dahulu
-- di bandingkan dengan operator OR. Untuk dapat membuat MySQL mengeksekusi operator OR terlebih dahulu, kita bisa bungkus
-- operator OR di dalam tanda kurung (). Karena di MySQL tanda () akan selalu di eksekusi pertama kali di banding dengan operator-operator lain.
SELECT * FROM products WHERE (category = 'Makanan' OR price > 2500000) AND category = 'Minuman';


-- ================= Where Operator (Like Operator) =================
-- Like Operator memiliki performa yg buruk, tidak di rekomendasikna jika kita memiliki data yg banyak. Karena Like akan search dari data ke 1 hingga data terakhir
-- Like operattor bersifat case insensitive, jdi huruf kapital atau kecil sama saja.

-- Search jika di field name ada data yg di awali dengan keyword Lapt
SELECT * FROM products WHERE name LIKE 'Lapt%' ;

-- Search jika di field name ada data yg di akhiri dengan keyword Lapt
SELECT * FROM products WHERE name LIKE '%Lapt';

-- Search jike field name di dalam nya terdapt keyword lapt
SELECT * FROM products WHERE name LIKE '%Lapt%';

-- Search jike field ane di dlama keywrod tidak terdapat keyword lapt (negasi)
SELECT * FROM products WHERE name NOT LIKE '%Lapt%';


-- ================= Where Operator (Null Operator) =================

-- Select data yg field category nya null
SELECT * FROM products WHERE category IS NULL;

-- Select data yg di field caegory nya bukan null
SELECT * FROM products WHERE category IS NOT NULL;


-- ================= Where Operator (Between Operator) =================
-- By default jika kita tidak nenetukan ASC atau DESC, Mysql akan mengurutkannya berdasarkan ASC
-- Select data yg field nya antara 0 sampai 7000 (range)
SELECT * FROM products WHERE price BETWEEN 0 AND 7000;

-- Select data yg field nya bukan antara 0 sampai 7000 (range) (negasi between)
SELECT * FROM products WHERE price NOT BETWEEN 0 AND 7000;


-- Order By Untuk Mengurutkan data berdasarkan field tertentu
-- Order berdasarkan field name secara ascending (a-z)
SELECT * FROM products ORDER BY name ASC;

-- Order berdasarkan field name secara descending (z-a)
SELECT * FROM products ORDER BY name DESC;

-- ORder bedasarakan field id secara desc terus urutkan lagi berdasarkan field name asc
SELECT * FROM products ORDER BY id DESC, name ASC;


-- LIMIT
-- Untuk mebuat MySQL hanya menampilkan 2 data
SELECT * FROM products LIMIT 2;

-- Untuk membuat MySQL skip 1 data dan menampilan 2 data Rumus: LIMIT skip, limit;
SELECT * FROM products LIMIT 1, 2;
-- atau
SELECT * FROM products LIMIT 2 OFFSET 1;

-- Distinct
-- Jika di sebuah field memilik data yg duplicate maka hanya akan di tampilkan sekali
-- Untuk menampikan field category, jika value dari field category ada yg duplicate, maka hanya akan di tampilkan satu datanya
-- misal category A ada 10 dan category B 1, maka akan di tampilkan 2 data aja
-- yaitu 1 data field A dan satu data field B
SELECT DISTINCT category FROM products;