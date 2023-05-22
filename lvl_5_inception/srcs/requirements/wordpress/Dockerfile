# Penultimate stable version: Debian 10 "buster" 
# https://www.debian.org/releases/
FROM debian:10.13

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
                    php7.3-hash \
                    php7.3-imagick \
                    php7.3-json \
                    php7.3-mbstring \
                    php7.3-mysql \
                    php7.3-pcre \
                    php7.3-xml \
                    php7.3-zip \
                    curl





# find a command that keeps this container alive
#CMD 
