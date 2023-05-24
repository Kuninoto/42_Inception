# Penultimate stable version: Debian 10 "buster" 
# https://www.debian.org/releases/
FROM debian:buster

LABEL maintainer="nnuno-ca@student.42porto.com"
LABEL version="1.0"
LABEL description="MariaDB Docker image for the Inception 42 project"

RUN apt-get update -yq && apt-get upgrade -yq

# Install MariaDB
RUN apt install mariadb-server -yq

# Copy and run mysql_setup script
COPY ./tools/mysql_setup.sh /mysql_setup.sh
RUN bash mysql_setup.sh

# Start the MySQL server process in the foreground,
# thus keeping the container alive
CMD ["mysqld"]
