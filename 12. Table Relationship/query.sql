-- Table Relationship

-- Foreign Key
-- Untuk membuat relationship antar table
-- value foreign key adalah valu dari primary key table lain
-- satu table boleh memiliki lebih dari satu foreign key
-- tipe data dari foreign key harus sama dengan primary key dari
-- table referensinya.

-- Menambahkan Foreign Key saat membuat table
-- Dengan menambahkanan foreign key, kita tidak akan bisa memasukan 
-- sembarang data ketika insert data ke table wishlist.
-- Jikalau id_product yg kita masukan tidak ada di table product,
-- maka MySQL akan menampilkan error ketika kita mencoba memasukan data tersebut
-- Namun jika id_product nya ada di table product, maka MySQL akan mengizinkan
-- kita untuk menginsert datanya.
-- By default jika kita membuat foreign key
-- tanpa setting mode nya, maka mode nya akan di set menjadi RESTRICT
-- otomatis oleh MySQL. Dimana kita tidak akan bisa untuk menghapus
-- data dari master table jikalau di dalam table child nya (klo disini table wishlist)
-- masih ada data. Dan juga kita tidak bisa mengupdate Primary key dari table
-- masternya jikalau di table child nya masih ada data
CREATE TABLE wishlist(
	id INT NOT NULL AUTO_INCREMENT,
	id_product VARCHAR(5),
	description TEXT NOT NULL,
	
	PRIMARY KEY (id),
	CONSTRAINT fk_wishlist_produk
		FOREIGN KEY (id_product) REFERENCES products(id)
) ENGINE = InnoDB;

-- Delete Foreign key
ALTER TABLE wishlist
    DROP CONSTRAINT fk_wishlist_produk;

-- Add Foreign key on existing table
-- Cascade, jika data master di hapus, maka data child table nya akan di hapus juga
-- Cascade jika primary key master di update, maka foreign key child akan di update juga
-- Better pake RESTRICT (default)
-- No Action, jika ada update/delete pada master table, table child nya akan di biarkan saja.
-- Set Null, jik ada uodate/delete pada master table, maka table child nya foreign key nya akan di bikin null
ALTER TABLE wishlist
    ADD CONSTRAINT fk_wishlist_produk
        FOREIGN KEY (id_product) REFERENCES products (id)
            ON DELETE Cascade 
            ON UPDATE Cascade