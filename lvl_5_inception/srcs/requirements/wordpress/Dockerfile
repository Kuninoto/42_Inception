# Penultimate stable version: Debian 10 "buster" 
# https://www.debian.org/releases/
FROM debian:buster

LABEL maintainer="nnuno-ca@student.42porto.com"
LABEL version="1.0"
LABEL description="WordPress Docker image for the Inception 42 project"

RUN apt-get update -yq && apt-get upgrade -yq

# Install PHP Extensions that WordPress makes use of
# and curl to latter download wp-cli
RUN apt install -yq php7.3 php-fpm php-mysql \
                    curl

# Copy WordPress config file to a tmp directory
COPY ./config/wp-config.php /tmp/

# Copy and run install_wordpress script as an entrypoint
COPY ./tools/install_wordpress.sh /tmp/
ENTRYPOINT [ "sh", "-c", "/bin/bash /tmp/install_wordpress.sh;" ]
