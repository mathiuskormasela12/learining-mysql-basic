
-- Untuk Masuk Kedalam MySql Client
mysql -u namaUsername -p 

Note:
Langsung klik enter, nanti mysql
akan meminta kita menuliskan passwordnya.

-- Untuk Menampilkan List Database yang ada (setiap perintah SQL harus di akhiri dengan titik koma)
SHOW DATABASES;

-- Untuk Menghapus database
DROP DATABASE nama_database;

-- Untuk Membuat database
CREATE DATABASE nama_table;

-- Contoh membuat database bernama mysql_basic
CREATE DATABASE mysql_basic;

-- Untuk menggunakna database, agar bisa melakukan operasi-operasi pada table
USE nama_database;

-- Contoh menggunakan/masuk ke database mysql_basic
USE mysql_basic;

-- UNtuk menampilkan list storage engine mysql
SHOW ENGINES;

Secara default MYSQL akan menggunakan storage engine InnoDB
DImana dengan InnoDB supports transactions, row-level locking, and foreign keys.
Ada engine MEMORY dimana database file akan di simpan di alam RAM.
Maka ketika kita merestart laptop kita data nya akan hilang.

-- Untuk Membuat database
CREATE TABLE nama_table (
    nama_field TYPE_DATA,
    nama_field2 TYPE_DATA
) ENGINE InnoDB;

-- Contoh membuat users
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -- NOT NULL berfungsi untuk membuat field full_name wajib di isi saya insert daat
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    birthday DATE NOT NULL,
    -- DEFAULT berfungsi untuk memberi nilai default dri sebuah field.
    -- By default, di MySQL jika sebuah field tidak disi, MYSQL otomatis mengisinya dengan nilai null
    photo VARCHAR(100) NOT NULL DEFAULT 'no-photo.png',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE InnoDB;

-- Untuk Menampilkan list table
SHOW TABLES;

-- Untuk melihat deskirpsi table
DESCRIBE nama_table;

atau

DES nama_table;

-- Untuk melihat query dri pembuatan sebuah table
SHOW CREATE TABLE nama_table;

-- Untuk menghapus table
DROP TABLE nama_table;

-- Untuk menambah field ketika table sudah terlanjut di buat
ALTER TABLE nama_table
ADD COLUMN nama_field_baru TYPE_DATA;

-- Contoh menanbah field username
ALTER TABLE users
ADD COLUMN username VARCHAR(255) NOT NULL;

-- Mengubah nama field
ALTER TABLE nama_table
RENAME COLUMN nama_kolom_lama TO nama_kolom_baru;

-- Mengubah field created_at menjadi dibuat_pada
ALTER TABLE users
RENAME COLUMN created_at TO dibuat_pada;

-- Untuk Memodifikasi tipe data sebuah field
ALTER TABLE nama_table
MODIFY nama_field_yg_mau_di_modifikasi TIPE_DATA_BARU;

-- Untuk menggantti tipe data birthday jadi TEXT
ALTER TABLE users
MODIFY birthday LONGTEXT;

-- Untuk menghapus field pada table
ALTER TABLE nama_table
DROP COLUMN nama_fiele_yg_mau_dihapus;

-- Untuk menghapus field birthday pada table users
ALTER TABLE users
DROP COLUMN birthday;

-- Untuk menghapus data sebuah table dan mysql kana otomatsi membuatkan table nya dari awal
TRUNCATE nama_table;

NOTE :
Setiap perintah SQL itu case insensitive
jadi mau di tulis huruf kapital atau huruf
kecil maka akan tidak error.