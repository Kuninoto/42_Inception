# Penultimate stable version: Debian 10 "buster" 
# https://www.debian.org/releases/
FROM debian:buster

LABEL maintainer="nnuno-ca@student.42porto.com"
LABEL version="1.0"
LABEL description="WordPress Docker image for the Inception 42 project"

RUN apt-get update -yq && apt-get upgrade -yq

# Install PHP Extensions that WordPress makes use of
# refer to: https://make.wordpress.org/hosting/handbook/server-environment/#system-packages
RUN apt install -yq php7.3 \
                    php7.3-common \
                    php7.3-curl \
                    php7.3-cgi \
				    php7.3-cli \
                    php7.3-dom \
                    php7.3-exif \
                    php7.3-fileinfo \
                    php7.3-fpm \
                    php7.3-gd \
                    php7.3-imagick \
                    php7.3-intl \
                    php7.3-json \
                    php7.3-mbstring \
                    php7.3-mysql \
                    php7.3-soap\
                    php7.3-xml \
                    php7.3-xmlrpc \
                    php7.3-zip \
                    curl

# Copy config file to its expected directory
COPY /config/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Copy WordPress config file
COPY ./config/wp-config.php /tmp/

# Copy the install_wordpress script
COPY ./tools/install_wordpress.sh /tmp/

# Run install_wordpress script
RUN bash /tmp/install_wordpress.sh

# Run php-fpm7.3 in the foreground thus keeping the container alive
CMD ["php-fpm7.3", "-F", "-R"]
