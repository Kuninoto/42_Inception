#!/bin/sh

# Downloads the WP-CLI PHAR (PHP Archive) file from the GitHub repository preserving its name
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# makes wp-cli.phar executable
chmod +x wp-cli.phar

# Move wp-cli.phar to a path that's on PATH env var and rename it as "wp"
mv wp-cli.phar /usr/local/bin/wp

# Downloads the latest version of WordPress to the current directory.
wp core download --allow-root

# Move the WordPress config file to its expected directory
mv /temp/wp-config.php /tmp/wordpress/wp-config.php

# Installs WordPress and sets up the basic configuration for the site.
# --url specifies the URL of the site
# --title sets the site's title
# --admin_user, --admin_password and --admin_email set admin's usernamem, password and email
# The --skip-email flag prevents WP-CLI from sending an email to the administrator with the login details.
wp core install --url="$WP_DOMAIN_NAME"\
                --title="$WP_TITLE"\
                --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD"\
                --admin_email="$WP_ADMIN_EMAIL" --skip-email\
                --allow-root

wp user create "$WP_USER_NAME" "$WP_USER_EMAIL" --user_pass="$WP_USER_PASSWORD" --allow-root

