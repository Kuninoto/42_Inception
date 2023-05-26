#!/bin/sh

# Start mysql
service mysql start

if ! [ -d "/var/lib/mysql/$MYSQL_DB_NAME" ]; then
    # Create a database named MYSQL_DB_NAME'S value if it doesn't exist already
    # Create a user named MYSQL_USER'S value if it doesn't exist already
    # Grant all privileges to the new user
    # Change the root's password to MYSQL_ROOT_PASSWORD's value
    # Flush the privileges to ensure that the changes take effect in the current session
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME ;" > temp.sql
    echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> temp.sql
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%' ;" >> temp.sql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> temp.sql
    echo "FLUSH PRIVILEGES;" >> temp.sql

    echo "-----------------------------"
    cat temp.sql
    echo "-----------------------------"

    mysql < temp.sql
    rm temp.sql
fi

kill $(cat /var/run/mysqld/mysqld.pid)

# Start the MySQL server process in the foreground,
# thus keeping the container alive
mysqld
