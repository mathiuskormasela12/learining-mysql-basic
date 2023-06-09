-- Transaction untuk menggabungkan beberapa perintah SQL
-- dan akan mem buat MySQL memperlakukan kumpulan perintah
-- itu sebagai kesatuan, dimana jika ada satu atau lebih
-- perintah yg gagal, maka otomatis MySQL akan menggagalkan
-- setiap perintahnya, baik perintah yg sukses atau pun failed

-- Perlu di perhatikan bahwa Transaction hanya bisa dilakukan
-- untuk perintah DML (Data Manipulation Language) seperti
-- perintah INSERT, UPDATE, DELETE, SELECT.
-- Namun tidak bisa digunakan untuk perintah DDL (Data Definition Language)
-- Sepert ALTER TABLE, CREATE TABLE, CREATE DATABASE.

-- Untuk memulai transaction
START TRANSACTION

-- Define kumpulakn SQL yg ingin di eksekusi
INSERT INTO products (id, name, category, price, quantity)
VALUES ('P000D', 'Macbook', 'Lain-Lain', 12000000, 4), ('P000F', 'Dispenser', 'Lain-Lain', 200000, 14);

SELECT * FROM products;

UPDATE products SET name = 'Mouse 2' WHERE id = 'P0003';

SELECT * FROM products;

-- Untuk mengirimkan perintah ke SQL untuk menyimpan hasil transaction
COMMIT


-- Untuk Memulai Transaction
START TRANSACTION

-- Define kumpulan SQL yg ingin di eksekusi
DELETE FROM products;

SELECT * FROM products;

-- Rollback data (jdi perintah diatas akan di rollback)
ROLLBACK

