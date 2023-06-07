-- Index
-- Untuk membuat mysql menyimpan data dalam bentuk B-tree bukannya tabular
-- agar mempercepat proses pencarian, tapi akan memperlambat
-- proses INSERT, UPDATE & DELETE. Oleh sebab itu kita harus
-- bijak dalam membuat index.
-- kita bisa membuat index lebih dari satu
-- Jika kita menggunakan PRIMARY KEY atau UNIQUE CONSTRAINT
-- MySQL akan otomatis menambahkan index ke dalam kolom tersebut
-- secara otomatis, jdi tidak perlu menambahkan index lgi
-- pada 2 kolom tersebut

-- Adding Index on Existing Table
ALTER TABLE users
ADD INDEX user_code_index (user_code);

-- Removing Index on Existing table
ALTER TABLE users
DROP INDEX user_code_index;

-- Create table with index
CREATE TABLE siswa (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    email2 VARCHAR(100) NOT NULL,
    email3 VARCHAR(100) NOT NULL,
    nisn VARCHAR(100) NOT NULL,
    ttl DATE NOT NULL,

    PRIMARY KEY (id),
    -- Akan meningkankan performa jike filter berdasarkan nisn
    INDEX nisn_index (nisn),

    -- Akan meningkatkan performa jika filter bedasarakn ttl
    INDEX ttl_index (ttl),

    -- Akan meningkatkan performa jika filter field email
    -- Akan meningkatkan performa jika filter field email & email2
    -- Akan meningkatkan performa jika filter field email, email2 dan email3
    INDEX email_email2_email3_index (email, email2, email3)
) ENGINE = InnoDb;


-- FULL-TEXT Search
-- Ketika melakukan search menggunakan perintah LIKE
-- MYSQL akan melakukan search data dari record pertama
-- hingga record terakhir. Ini sangat membuat proses search
-- menjadi lemot meskipun kita menambahkan index. Untuk Solve
-- Itu kita harus menggunakanan FULLTEXT Search. Namun
-- Jika case nya bener2 ingin membuat search engine, better
-- pake database yg khusus untuk search engine, contoh nya elastic search

-- Crete table with FullTextSearch
CREATE TABLE artikel (
    id INT NOT NULL AUTO_INCREMENT,
    author VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    -- Add FullTextSearch
    FULLTEXT artikel_search (title, content)
) ENGINE = InnoDb;

INSERT INTO artikel(author, title, content) 
VALUES ('Mathius', 'Belajar Javascript', 'Javascript adalah sebuah bahasa program'),
('Yerin', 'Belajar Typescript', 'Typescript adalah superset Javascript'),
('Sowon', 'Learning Dance', 'Dance atau berdansa adalah seseuatu hal yg cukup menarik'),
('Eunha', 'Coba Javascript', 'apa sih itu js');

-- Cara menggunakan Fulltext search dengan mode Natural Language
-- Untuk search perkata
-- misal ada kaata 'Halo Javascript'
-- bisa search 'Halo' atau 'Javascript'
-- klo search 'alo' atau 'script gk bisa
SELECT * 
FROM artikel
WHERE MATCH(title, content)
AGAINST('belajar' IN NATURAL LANGUAGE MODE);

-- Cara menggunakan Fulltext search dengan Boolean Mode
-- Untuk search berdasarklan kata bahkan lebih keren
-- bisa nge exclude kata
-- Cari artikel yg kolom title dan content nya berisi kata
-- Learning tapi yg gk punya kata bahasa
-- ini bersifat case insensitive (jdi huruf kapital dan huruf kecil di anggap sama)
SELECT *
FROM artikel
WHERE MATCH (title, content) AGAINST ('+Learning -bahasa' IN BOOLEAN MODE);

-- Fulltext search menggunakan Query Expansion 
-- Untuk search perkata, namun akan do search 2 kali
-- misal search kata "coba", dan ternyata hasil di kolom yg memiliki
-- kata learning ada kata "Javascript", maka akan di search berdasarkan kata "Javascript" juga
SELECT *
FROM artikel
WHERE MATCH (title, content) AGAINST ('coba' WITH QUERY EXPANSION);

-- Delete FUlltext
ALTER TABLE artikel
DROP INDEX artikel_search;

-- Add Fulltext on existing table
ALTER TABLE artikel
ADD FULLTEXT artikel_search (title, content);