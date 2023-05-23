#!/bin/sh

# Downloads the wp-cli PHAR (PHP Archive) file from the GitHub repository preserving its name
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Makes wp-cli.phar executable
chmod +x wp-cli.phar

# Move wp-cli.phar to a path that's on PATH env var and rename it as "wp-cli"
mv wp-cli.phar /usr/local/bin/wp-cli

# Downloads the latest version of WordPress to the current directory
wp-cli core download --allow-root

# Move the sample WordPress config file to /var/www/html,
# renaming it to wp-config
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Alter the WordPress default config file
# Search for the first occurance of left field and substitute for the right field
#line 23
sed -i -r "s/DB_NAME/$MYSQL_DB_NAME/1" /var/www/html/wp-config.php
#line 26
sed -i -r "s/DB_USER/$MYSQL_DB_USER/1" /var/www/html/wp-config.php
#line 29
sed -i -r "s/DB_PASSWORD/$MYSQL_DB_PASSWORD/1" /var/www/html/wp-config.php
#line 32
sed -i -r "s/localhost/mariadb/1" /var/www/html/wp-config.php

# Installs WordPress and sets up the basic configuration for the site.
# --url specifies the URL of the site
# --title sets the site's title
# --admin_user, --admin_password and --admin_email sets admin's username, password and email
# --skip-email prevents wp-cli from sending an email to the administrator with the login details.
wp-cli core install --url="$WP_DOMAIN_NAME" \
                    --title="$WP_TITLE" \
                    --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" \
                    --admin_email="$WP_ADMIN_EMAIL" --skip-email \
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

# Config php.ini
sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php/7.3/fpm/php.ini
sed -i "s/upload_max_filesize = .*/upload_max_filesize = 128M/" /etc/php/7.3/fpm/php.ini
sed -i "s/zlib.output_compression = .*/zlib.output_compression = on/" /etc/php/7.3/fpm/php.ini
sed -i "s/max_execution_time = .*/max_execution_time = 18000/" /etc/php/7.3/fpm/php.ini
