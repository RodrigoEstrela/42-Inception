#!/bin/bash



service mysql start 


echo "CREATE DATABASE IF NOT EXISTS '$MDB_WP_NAME' ;" > $MDB_WP_NAME
echo "CREATE USER IF NOT EXISTS '$MDB_USER_NAME'@'%' IDENTIFIED BY '$MDB_USERPWD' ;" >> $MDB_WP_NAME
echo "GRANT ALL PRIVILEGES ON $MDB_WP_NAME.* TO '$MDB_USER_NAME'@'%' ;" >> $MDB_WP_NAME
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'inception123' ;" >> $MDB_WP_NAME
echo "FLUSH PRIVILEGES;" >> $MDB_WP_NAME

mysql < $MDB_WP_NAME

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
