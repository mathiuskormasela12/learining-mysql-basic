-- Constraint merupakan sesuatu dalam MySQL
-- yg dapat kita gunakan untuk melakukan validasi
-- agar setiap value yg di insert/update ke database
-- sudah terfilter dari value-value yg seharus nya
-- tidak di inginkan

-- 1. Unique Constraint
-- Untuk memastikan tidak ada nya duplikasi value pada sebuah field

-- Create table with Unique Constraint
CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    user_id VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    -- Adding Unique Constraint
    UNIQUE KEY email_unique (email),
    UNIQUE KEY user_id_unique (user_id)
) ENGINE = InnoDB;

INSERT INTO custumers(first_name, last_name, email) 
VALUES ('Yerin', 'Jung', 'yerin@gmail.com');

-- Menambahkan Unique Constraint ke Existing Table
ALTER TABLE customers
ADD CONSTRAINT email_unique UNIQUE (email);

-- Menghapus Unique Constaint
ALTER TABLE customers
DROP CONSTRAINT email_unique;


-- 2. Check Constraint
-- Untuk membuat logic untuk validasi sebuah kolom
-- Create Table with Check Constraint
CREATE TABLE produk (
    id INT NOT NULL AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    harga INT UNSIGNED DEFAULT 0,
    total INT UNSIGNED DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    CONSTRAINT harga_check CHECK (harga > 1000)
) ENGINE = InnoDb;

INSERT INTO produk(nama, harga, total) 
VALUES ('Macbook', 500, 1);

-- Create Check Constrain Existing Table
ALTER TABLE produk
ADD CONSTRAINT harga_check CHECK (harga > 1000);

-- Remove Check Constraint
ALTER TABLE produk
DROP CONSTRAINT harga_check;