-- User Managemenr

-- Membuat User dengan host localhost
-- Host nya bisa di ganti dengan IP address,
-- Host berfungsi untuk memberitahu MySQL bahwa user 
-- tersebut hanya boleh di akses oleh localhost atau IP address apa. 
-- Better untuk gunakain ini, entah itu localhost atau IP address server kita
CREATE USER 'mathius'@'localhost';

-- Membuat user dengan host apapun
-- Dimana database dpt di akses dari host manapun.
-- Tidak recommended
CREATE USER 'mathius'@'%';

-- Untuk menghapus user
DROP USER 'mathius'@'localhost';

-- Untuk set password
SET PASSWORD FOR 'mathius'@'localhost' = 'mathius123';

-- Memberikan Hak Akses
-- Mengizinkan user 'mathius'@'localost' untuk dpt SELECT data, INSERT data, UPDATE Data & DELETE data
-- pada setiap table dari database mysql_basic .
-- rumus :
-- GRANT hak-access-misal-select ON nama_database.nama_table_klo_*_artinya_semua_table TO 'username'@'host username'
GRANT SELECT, INSERT, UPDATE, DELETE ON mysql_basic.* TO 'mathius'@'localhost';

-- Remove Hak Akses
REVOKE INSERT, UPDATE, DELETE ON mysql_basic.* FROM 'mathius'@'localhost';