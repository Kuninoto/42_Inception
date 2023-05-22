# Penultimate stable version: Debian 10 "buster" 
# https://www.debian.org/releases/
FROM debian:10.13

RUN apt-get update -yq && apt-get upgrade -yq

# Install mariadb
RUN apt install mariadb-client mariadb-server -yq




# Run mysql daemon to keep the container alive
# CMD 
