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