# MySQL

## Dump and restore a database

Running dump to an outfile:

    mysqldump -u [username] -p[user_password] -h [hostname] [database_name] > dump.sql

Restoring from the file:

    mysql -u [username] -p[user_password] -h [hostname] [database_name] < dump.sql

Example:

    mysqldump -u root -pABC123 -h example.com myapp > myapp.sql
    mysql -u root -pABC123 -h example.com myapp < myapp.sql
    
## Dumping large files

Skip lock tables and compress using pigz:
    
    mysqldump --skip-lock-tables ... | /usr/bin/pigz -9 > dump.gz
