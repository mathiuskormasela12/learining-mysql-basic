-- Locking Record
-- Secara default jika kita sudah menggunaakn Transaction
-- Kita sudah melakukan Locking Record secara otomatis. 
-- Namun jika kita ingin melakukan Locking Record secara manual kita bisa
-- melakukan perintah di bawah :

-- 1. SELECT FOR UPDATE
-- User A
START TRANSACTION

-- FOR UPDATE akan menunggu user lain selesai memanipulasi record yg ingin di select
SELECT * FROM products WHERE id = 'P000D' FOR UPDATE;

COMMIT

-- User B
START TRANSACTION

-- Jika perintah ini blm di jalankan dan di commit
-- Maka perintah SELECT FOR UPDATE tidak akan di jalankan
UPDATE products SET name = 'Macbook Pro' WHERE id = 'P000D';

COMMIT

-- Locking Table
-- Untuk locking table
-- Lock table products dengan READ
-- Proses yg melakukan LOCK READ, hanya bisa READ data, klo WRITE data gk bisa
-- Proses yg lain bisa READ data, namun gk bisa WRITE sampai LOCK nya di UNLOCK
LOCK TABLES products READ;

-- Untuk Unlock table
UNLOCK TABLES;

-- Locking Table dengan WRITE
-- Proses yg melakukan LOCK WRITE bisa melakukan WRITE & READ
-- Proses yg lain tidak bisa melakukan WRITE & READ selama table  blm di unlock
LOCK TABLES products WRITE;

-- Lock Instance
-- Untuk membuat perinah DDL akan menunggu hingga Instance di Unlock
LOCK INSTANCE FOR BACKUP;

-- Unlock instance
UNLOCK INSTANCE;