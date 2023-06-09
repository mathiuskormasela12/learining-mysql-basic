-- 1. UNION
-- Untuk menggabungkan dua table dan 
-- akan menghapus/tidak menampilan data 
-- yg duplicate, dimana data duplikat 
-- hanya akan di tampilakn sekali
-- INi kan menampilakn email yg ada  di dalam table emails1 dan emails2
-- Klo ada yg duplikat tampilin sekali aja
SELECT mail1.email FROM emails1 mail1
UNION
SELECT mail2.email FROM emails2 mail2

-- 2. UNION ALL
-- Untuk menggabungkan dua table dan 
-- akan teap menamilkna data yg duplikat
SELECT mail1.email FROM emails1 mail1
UNION ALL
SELECT mail2.email FROM emails2 mail2

-- 4. Intersect
-- Untuk menggabungkan 2 table dan memampilkan data yg sama yg ada di dlm kedua table yg di gabungkan
-- misal di tabla A ada angka 1,2,3 dan di table B ada angka 2,3,4
-- maka yg akan di tampilkan adalah angka 2 dan 3
-- Cara Pertama
SELECT tableA.number FROM tableA
WHERE tableA.number IN (
    SELECT tableB.number
    FROM tableB
);
-- Cara Kedua
SELECT tableA.number FROM tableA
INNER JOIN tableB ON (tableA.number = tableB.number);

-- 5. Minus
-- Untuk menggabungkuan 2 table dan menampilkan 
-- misal di tabla A ada angka 1,2,3 dan di table B ada angka 2,3,4
-- maka akan di tampilkan angka 1
SELECT tableA.number FROM tableA
LEFT JOIN tableB ON (tableA.number = tableB.number)
WHERE tableB.number IS NULL;