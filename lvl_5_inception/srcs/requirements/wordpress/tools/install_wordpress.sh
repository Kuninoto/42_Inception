#!/bin/sh

mkdir -p /var/www/
mkdir -p /var/www/html
cd /var/www/html

# Downloads the wp-cli PHAR (PHP Archive) file from the GitHub repository preserving its name
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Makes wp-cli.phar executable
chmod +x wp-cli.phar

# Move wp-cli.phar to a path that's on PATH env var
# and rename it as "wp-cli"
mv wp-cli.phar /usr/local/bin/wp-cli

# Downloads the latest version of WordPress to the current directory
wp-cli core download --allow-root

# Generates a wp-config.php with our configurations
wp-cli config create --dbname=$MYSQL_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST

# Installs WordPress and sets up the basic configuration for the site.
# --url specifies the URL of the site
# --title sets the site's title
# --admin_user, --admin_password and --admin_email sets admin's username, password and email
# --skip-email prevents wp-cli from sending an email to the administrator with the login details.
wp-cli core install --url=$WP_DOMAIN_NAME/ \
                    --title=$WP_TITLE \
                    --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD \
                    --admin_email=$WP_ADMIN_EMAIL --skip-email \
                    --allow-root

# Creates a new user account with the specified username, email adress and password
# --role sets the user's role to author, which gives the user the ability to publish
# and manage their own posts
wp-cli user create $WP_USER_NAME $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

# Installs Astra theme and makes it the current theme for the site
wp theme install astra --activate --allow-root

# Modify the www.conf file substituting the value 9000 for /run/php/php7.3-fpm.sock throughout the file,
# this changes the socket that PHP-FPM listens on from a Unix domain socket to a TCP port
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# Creates /run/php directory, which is used by PHP-FPM to store Unix domain sockets
mkdir /run/php

# Run php-fpm7.3 in the foreground thus keeping the container alive
php-fpm7.3 -F -R
