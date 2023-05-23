# Penultimate stable version: Debian 10 "buster" 
# https://www.debian.org/releases/
FROM debian:buster

RUN apt-get update -yq && apt-get upgrade -yq

# Install MariaDB
RUN apt install mariadb-server -yq

# Copy and run mysql_setup script
COPY ./tools/mysql_setup.sh /mysql_setup.sh
RUN bash mysql_setup.sh

# Run mysql daemon with the safe script to keep the container alive
CMD ["mysqld_safe"]
