-- Table Join
-- Join, Inner Join, Left Join, Right Join & Cross Join
-- Tidak wajib memiliki foreign key
-- Tapi better pake foreign key

-- 1. Join / Inner Join
-- Join beberata table dang hanya menampilkan data yg memenuhi kondisi
-- yg ada di keywird ON.
SELECT t.id, s.first_name, s.email, t.book_name FROM mid_test AS t
JOIN students AS s ON (t.writer_id = s.id);

atau

SELECT t.id, s.first_name, s.email, t.book_name FROM mid_test AS t
INNER JOIN students AS s ON (t.writer_id = s.id);

-- 2. Left Join
-- Join beberapa table dan akan menampilkan sebuah data dari table pertama.
-- Untuk table setelahnya akan di tampikan data yg match dengan kondisi di ON keyword aja.
SELECT * FROM mid_test 
LEFT JOIN students ON (mid_test.writer_id = students.id);

-- 3. Right Join
-- Join beberapa table dan akan menampilkan sebuah data dari table kedua.
-- Untuk table setelahnya akan di tampikan data yg match dengan kondisi di ON keyword aja.
SELECT * FROM mid_test 
RIGHT JOIN students ON (mid_test.writer_id = students.id);

-- 4. Cross Join
-- Join beberapa table dan melakukan perkalian, misal tabla A ada 4 record dan table B ada 4 record
-- Maka akan menampilkan 4 * 4 = 16 record
SELECT * FROM mid_test
CROSS JOIN students;

CREATE TABLE numbers (
	id INT NOT NULL AUTO_INCREMENT,
	number INT NOT NULL,
	
	PRIMARY KEY (id)
) ENGINE = InnoDb;


INSERT INTO numbers(number) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

SELECT * FROM numbers;

SELECT 
x.number As X, 
y.number As Y, 
x.number * y.number As Result 
FROM numbers AS x
CROSS JOIN numbers AS y
ORDER BY X ASC, Y ASC;

-- 1. Relasi One to One
-- Satu record di dalam table A hanya boleh memiliki satu record di dalam table B
-- Pada Foreign Key nya harus memiliki CONSTRAINT UNIQUE KEY, agar tidak terjadi
-- duplicate pada foreign key, karena memang aturannya satu data hanya memiliki relasi ke
-- satu data juga

-- 2. Relasi One to Many
-- Satu record di table A boleh memiliki lebih dari satu record di dalam table B
-- Tanpa Unique Key Constraint

-- 3. Relasi Many to Many
-- Satu record di table A boleh memiliki banyak record relasi di table B
-- Dan satu recrod di table B boleh memiliki banyak record relasi di TABLE A.
-- Biasnaya kita kan membuat table pembantu untuk melakukan relasi Many to Many
-- Dimana table A akan berelasi One to Many ke table pembantu dan Table B akan
-- berelasi One to Many terhadap table pembantu, maka Table A memilik relasi Many to Many
-- terhadapt table B