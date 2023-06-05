-- Membuat table products

CREATE TABLE products (
    id VARCHAR(5) NOT NULL,
    name VARCHAR(100) NOT NULL,
    -- UNSIGNED untuk membuat value nya itu tidak boleh minus, minmimal 0
    price INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDb;

-- Insert single data ((id, name, price) urutan field nya gk perlu berurutan ) defined nama kolom
INSERT INTO products(id, name, price) VALUES ('P0001', 'Laptop', 75000000);

-- Insert bulk data (defined nama kolom)
INSERT INTO products(id, name, price, quantity) VALUES ('P0002', 'Printer', 2500000, 2), ('P0003', 'Mouse', 1500, 5);

-- Insert data tanpa defined nama kolom (wajib mendefinsikan semua kolomnya, bahkan kolomnya boleh empty/null, klo gk error)
INSERT INTO products VALUES ('P0004', 'Test', 2300, 10, '2023-06-05');

-- Untuk menampilkan data (menampilkan semua kolom)
SELECT * FROM products;

-- Untuk menampilkan data (menampilkan  beberapa kolom) (menampikan kolom name, id & price) urutannya juga gpp ngacak
SELECT price, id, name from products;

-- Primary key merupakan id dari sebuah table. Dalam MySQL
-- Primary Key bukanlan suatu yg wajib, namun lebih di saranakn
-- sebuah table untuk memiliiki setidaknya 1 primary key
-- Primary key adalah identitas untuk setiap baris datanya
-- Primary key harus unik, tidak boleh ada primary key yg value nya sama
-- Dalam MySQL memungkinkan untuk memiliki lebih dari satu primary key
-- misal 2 atau 3 kolom yg akan menjadi primary key
-- namun lebih di sarankan untuk memiliki hanya 1 primary key
-- Kecuali ada case-case spesial, contoh jika ingin mengimplementasikan
-- relasi Many To Many
CREATE TABLE users(
    id INT AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Membuat kolom id & username menjadi primary key
    PRIMARY KEY (id, username)
) ENGINE = InnoDb;

-- Menambah primary key pada existing table
ALTER TABLE products
ADD PRIMARY KEY (id);

-- Where Clause
-- Untuk menfilter data berdasarkan kolom tertentu
-- Akan bersifat Case Insensitive
-- jadi jika di database adanya nama nya Mathius
-- tapi kita tulis di where clause nya adalah mathius
-- maka mysql akan tetep menampilkan data nya
-- karena mysql tidak perduli huruf besar atau huruf kecil
SELECT * FROM products WHERE name = 'laptop';