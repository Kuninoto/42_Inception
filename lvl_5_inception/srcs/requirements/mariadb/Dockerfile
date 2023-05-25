# Penultimate stable version: Debian 10 "buster" 
# https://www.debian.org/releases/
FROM debian:buster

LABEL maintainer="nnuno-ca@student.42porto.com"
LABEL version="1.0"
LABEL description="MariaDB Docker image for the Inception 42 project"

RUN apt-get update -yq && apt-get upgrade -yq

# Install MariaDB
RUN apt install -yq mariadb-server

# Copy and run mysql_setup script
COPY ./tools/mysql_setup.sh /tmp/mysql_setup.sh
ENTRYPOINT [ "sh", "-c", "/bin/bash /tmp/mysql_setup.sh;" ]
