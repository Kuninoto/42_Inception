#!/bin/sh

# start mysql
service mysql start

# Change bind-address from 127.0.0.1
# to 0.0.0.0 so that any network can connect
sed -i 's/\b127.0.0.1/\b0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# Execute a query to check if the database already exists and capture the output
query_result=$(mysql -u $MYSQL_USER -p -e "SHOW DATABASES LIKE '${MYSQL_NAME}';")
# Check the query_result
if [[ $query_result == "$MYSQL_NAME" ]]; then
    echo "Database \"$MYSQL_NAME\" already exists"
else
    # Create a database named MYSQL_NAME'S value if it doesn't exist already
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;" > temp.sql

    # Log message
    echo "Created a new database \"$MYSQL_NAME\""

    # Create a user named MYSQL_USER'S value if it doesn't exist already
    echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@localhost IDENTIFIED BY '$MYSQL_PASSWORD';" >> temp.sql

    # Grant all privileges to the new user
    echo "GRANT ALL PRIVILEGES ON *$MYSQL_NAME* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;" >> temp.sql

    # Change the root's password to MYSQL_ROOT_PASSWORD's value
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> temp.sql

    # Flush the privileges to ensure that the changes take effect in the current session
    echo "FLUSH PRIVILEGES;" >> temp.sql

    mysql < temp.sql
fi

# shutdown mysql as root
# service mysql stop wouldn't work because
# above we changed the root's password to 
# MYSQL_ROOT_PASSWORD's value so we lost our
# auth as root until the password is inserted again
mysqladmin -u root -p ${MYSQL_ROOT_PASSWORD} shutdown;
