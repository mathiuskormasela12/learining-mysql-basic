-- Auto Increment di MySQL harus di tulis pada kolom primary key
-- gk boleh pada kolom selain primary key.
-- Membuat table baru yg memiliki auto increment
CREATE TABLE admin(
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id)
) ENGINE = InnoDb;

INSERT INTO admin(first_name, last_name) 
VALUES('Sojung', 'Kim'),
      ('Yerin', 'Jung');

INSERT INTO admin(first_name, last_name) 
VALUES('Yuna', 'Choi'),
      ('Eunbi', 'Jung');

INSERT INTO admin(first_name, last_name) 
VALUES('Eunbi', 'Hwang'),
      ('Yewon', 'Kim');

-- Untuk mengetahui terakhir kali id yg di buat oleh auto increment itu nomor brp
SELECT LAST_INSERT_ID();