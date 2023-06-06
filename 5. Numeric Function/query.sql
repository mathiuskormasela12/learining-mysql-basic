-- Dalam SQL terdapat yang namanya Numeric Function yg berfungsi untuk membantu
-- kita melakukan operasi matematika. Dalam MySQL numeric function di bagi
-- ke dalam 2 kategori, yaitu Arithmetic Operator & Mathematical Function

-- Arithmetic Operator
-- 1. Untuk melakukan modulus atau sisa bagi. (MOD atau %)
-- Dengan MOD
SELECT id, name, price MOD 1000 FROM products; 
-- Dengan %
SELECT id, name, price % 1000 FROM products;

-- 2. Untuk melakukan perkalian
SELECT id, name, price * 2 FROM products;

-- 3. Untuk melakikan pembagian yg dapat menghasilkan nilai float
SELECT id, name, price / 2 FROM products;
-- Kita bisa menggunakan Numeric Method langsung di perintah SELECT tanpa memiliki table.
SELECT 100 / 2 AS Coba;

-- 4. Untuk melakukan pembagian yg sekaku menghasilkan angka integer
SELECT id, name, price DIV 2 AS 'Divide INT' FROM products;

-- 5. Untuk melakukan pertambahan
SELECT id, name, price + 1000 FROM products;

-- 6. Untuk melakukan pengurangan
SELECT id, name, price - 1000 FROM products;

-- 7. Untuk membuat angka negatif
SELECT -10 AS Minus;


-- Mathematical Function
-- Untuk membuat SIN, COS, TAN, dan perpangkatan
-- POWER(2, 3) adalah 2 pangkat 3 yg bhaislnya 8
-- ABS untuk membuat angka absolute, klo minus jdi plus klo plus tetap plus
SELECT SIN(price), COS(price), TAN(price), POWER(2, 3), ABS(-1) FROM products;
-- Membulatkan ke atas
SELECT CEIL(2.2) AS 'Pembulatan Keatas';
-- Membulatkan ke bawah
SELECT FLOOR(2.8) AS 'Pembulatan Kebawah';
-- Membulatkan ke angka terdekat
-- Kalo angka di belakang koma nya itu 0-4 maka akan di bulatkan ke bawah
-- klo angka di belakang koma nya itu 5-9 maka akan di bulatkan ke atas
SELECT ROUND(2.4) as 'Pembulatan Ke Angka Terdekat (Hasil ROUND(2.4) adalah 2)';
SELECT ROUND(2.5) as 'Pembulatan Ke Angka Terdekat (Hasil ROUND(2.5) adalah 3)';