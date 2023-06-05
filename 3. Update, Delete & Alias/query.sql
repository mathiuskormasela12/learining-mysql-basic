-- Untuk mendsbah kolom baru setelah kolom tertentu
ALTER TABLE products
ADD COLUMN category ENUM('Makanan', 'Minuman', 'Lain-Lain')
AFTER name;

-- Untuk mengupdate data
UPDATE products SET category = 'Makanan' WHERE id = 'P0001';

-- Untuk mengupdate data dengan menggunakan existing value
-- misal value nya price adalah 10000 maka jika perintah dibawah di jalankan
-- maka value dari price akan berubah menjadi 10000 + 5000 yaitu 15000
-- hati dalam update data, jika kita tidak menulis where clause nya
-- maka MYSQL akan mengupdate seluruh isi tablennya
UPDATE products SET price = price + 5000 WHERE id = 'P0003';

INSERT INTO products(id, name, category, price) VALUES ('P0005', 'Coba-coba', 'Minuman', 500);

-- Untuk menghapus data
-- Hati-hati dalam menghapus data, jika kita tidak menuliskan
-- where clause nya maka bisa-bisa semua data dalam table nya akan
-- kehapus semua.
DELETE FROM products WHERE id = 'P0005';

-- Dalam MySQL di perintah Select kita bisa menggunakna fitur alias
-- dimana fitur ini memungkinkan kita untuk memebrikan alias kepada 
-- sebuah kolom atau table.
-- Jika aliasnya single text atau text tanpa spasi, kita
-- kita bisa langsung menulis nama aliasnya, tpi klo ada spasinya
-- misal Nama Produk, maka hrus di tulis pake petik dua atau petik satu
SELECT p.name AS 'Nama Produk', 
       p.price AS harga
FROM products AS p;

-- atau bisa juga tanpa keyword As, langsung nama aliasnya
SELECT name 'Nama Produk', 
       price harga
FROM products p;