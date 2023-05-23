# Penultimate stable version: Debian 10 "buster" 
# https://www.debian.org/releases/
FROM debian:buster

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

# Copy the install_wordpress script
COPY ./tools/install_wordpress.sh /tmp/install_wordpress.sh

# Runs install_wordpress script
RUN bash install_wordpress.sh

# Run php-fpm7.3 in the foreground, keeping the container alive
CMD ["php-fpm7.3", "-F", "-R"]
