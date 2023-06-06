-- Dalam MySQL terdapat banyak sekali function yg dapat digunakan 
-- untuk memanipulasi string.

SELECT 
id,
-- Untuk membuat string menjadi huruf besar
UPPER(name) As 'Name Huruf Kapital',

-- Untuk membuat string menjadi huruf kecil
LOWER(name) As 'Name Huruf Kecil',

-- Untuk menampilkan panjang sebuah string
LENGTH(name) as 'Panjang String Name',

-- Untuk mengambil karakter string dari karakter ke berapa dan panjangy brp
-- mirip dngan substr nya Javascriot.
-- Contoh di bawah SUBSTR(name, 2, 3)
-- berarti ambilkan karakter dari index ke 2 dan panjangnya 3 digit
-- jadi rumus nya : SUBSTR('string nya', mau di ambil dri index kebarapa, panjangnya berapa)
-- di MySQL index SUBSTRT di mulai dengan angka 1 bukan 0
SUBSTR(name, 2, 3) As 'Mengambil Karakter (SUBSTR(name, 2, 3))'
FROM products;