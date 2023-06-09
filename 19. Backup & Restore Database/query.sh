# Backup Database
# rumus mysqldump nama_database --user usernamenya --password --result-file=folder_tempat_kita_akan_simpen_hasil_backupan_nya
mysqldump mysql_basic --user root --password --result-file=/Users/mathius/Documents/backup.sql

# Restore Database
# Cara Pertama dengan perintah MySQL Client
mysql --user=root --password mysql_basic_restore < /Users/mathius/Documents/backup.sql

# Cara Kedua dengan perintah source
Masuk dulu ke dalam MySQL Client
mysql -uroot -p
trus create database baru
habis itu ketikan ini di terminal
mysql client
source /Users/mathius/Documents/backup.sql

otomatis databsase bakal ke restore