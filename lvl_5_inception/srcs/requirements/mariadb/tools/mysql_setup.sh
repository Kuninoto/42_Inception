#!/bin/sh

# start mysql
service mysql start

# Automated mysql_secure_installation
mysql -sfu root << EOF
-- set root password
UPDATE mysql.user SET Password=PASSWORD('$MYSQL_DB_PASSWORD') WHERE User='root';
-- delete anonymous users
DELETE FROM mysql.user WHERE User='';
-- delete remote root capabilities
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
-- drop database 'test'
DROP DATABASE IF EXISTS test;
-- also make sure there are lingering permissions to it
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
-- make changes immediately
FLUSH PRIVILEGES;
EOF

# Execute a query to check if the database already exists and capture the output
query_result=$(mysql -u username -p -e "SHOW DATABASES LIKE '${MYSQL_DB_NAME}';")

# Check the query_result
if [[ $query_result == *"$MYSQL_DB_NAME"* ]]; then
    echo "Database \"$MYSQL_DB_NAME\" already exists"
else
    # Create a database named MYSQL_DB_NAME'S value if it doesn't exist already
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;" > temp.sql

    # Log message
    echo "Created a new database \"$MYSQL_DB_NAME\""

    # Create a user named MYSQL_DB_USER'S value if it doesn't exist already
    echo "CREATE USER IF NOT EXISTS '$MYSQL_DB_USER'@'%' IDENTIFIED BY '$MYSQL_DB_PASSWORD';" >> temp.sql

    # Grant all privileges to the new user
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_DB_USER'@'%';" >> temp.sql

    # Flush the privileges to ensure that the changes take effect in the current session
    echo "FLUSH PRIVILEGES;" >> temp.sql

    mysql < temp.sql
fi


service mysql stop;
