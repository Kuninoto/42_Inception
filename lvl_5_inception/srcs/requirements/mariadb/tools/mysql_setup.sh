#!/bin/sh

# Start mysql
service mysql start

# Automated mysql_secure_installation
# Set root password
# Delete anonymous users
# Delete remote root capabilities
# Drop database 'test'
# Also make sure there are lingering permissions to it
# Flush the privileges to ensure that the changes take effect in the current session
mysql -sfu root << EOF
UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF

# Create a database named MYSQL_DB_NAME'S value if it doesn't exist already
# Create a user named MYSQL_USER'S value if it doesn't exist already
# Grant all privileges to the new user
# Change the root's password to MYSQL_ROOT_PASSWORD's value
# Flush the privileges to ensure that the changes take effect in the current session
mysql << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

# shutdown mysql as root
# service mysql stop wouldn't work because
# above we changed the root's password to 
# MYSQL_ROOT_PASSWORD's value so we lost our
# auth as root until the password is inserted again
mysqladmin -u root -p $MYSQL_ROOT_PASSWORD shutdown;

# Start the MySQL server process in the foreground,
# thus keeping the container alive
mysqld
