#!/bin/sh
chown -R mysql:mysql /var/lib/mysql
mysql_install_db --user mysql > /dev/null

#mysqld_safe --user mysql &
service mysql start

sleep 5s

mysql -v < /root/mariadb.sql

sleep 5s

service mysql restart