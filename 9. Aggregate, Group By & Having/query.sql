-- MySQL Aggragate untuk menghasilkan data yg berbeda dari kumpulan data
-- Ketika kita melakukan aggregate data, jgn menampilkan kolom lain karena akan error
-- Klo ingin nampilin kolom lain mesti pake group by

-- 1. SUM 
-- Untuk melakukan SUM (kalkulasi value dri sebuah kolom)
-- Untuk menjumlahkan value dari kolom price
SELECT SUM(price) AS 'Total Price' FROM products;

-- 2. COUNT
-- Untuk mengecek jumlah record dari sebuah kolom (jika value kolomnya null, maka gk bakal di hitung)
-- Mengecek total records berdasarkan kolom id
SELECT COUNT(id) AS 'Total Record' FROM products;

-- 3. MAX
-- Untuk mengecek value paling tinggi dari sebuah kolom
-- Menampilan harga produk paling mahal di table products
SELECT MAX(price) 'Termahal' FROM products;

-- 4. MIN
-- Untuk menampilkan value paling kecil dari sebuah kolom
-- Menampilkan harga produk paling murah
SELECT MIN(price) as 'Murah' FROM products;

-- 5. AVG
-- Untuk menampilkan rata-rata dari nilai sebuah kolom
-- Menampilkan rata-rata harga produk
SELECT AVG(price) 'Rata-Rata' FROM products;

-- Group By
-- Untuk mengelompokan data berdasarkan field tertentu
-- Group By clause ini hanya working jika kita menggunakan aggregate function

-- Mengelompokan data berdasaerkan field category
SELECT category, COUNT(id) AS 'Total Product' FROM products GROUP BY category;

-- Having befungsi untuk melakukan filter terhadap field hasil aggregate function
-- Kita tidak bisa menggunakan WHERE clause untuk filter kolom yg terbuat dari aggregate function
-- Tampilakn data yg field total nya lebih dari 2300
SELECT 
SUM(price) total,
category
FROM products
GROUP BY category
HAVING total > 2300;