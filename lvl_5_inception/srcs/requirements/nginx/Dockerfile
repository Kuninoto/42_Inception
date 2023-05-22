# Penultimate stable version: Debian 10 "buster" 
# https://www.debian.org/releases/
FROM debian:10.13

RUN apt-get update -yq && apt-get upgrade -yq

# Install nginx and openssl
RUN apt install nginx openssl -yq

# Copy pre-designed config file to the container
COPY /config/nginx.conf /etc/nginx/

# Generate a self-signed certificate
RUN openssl req \
	-x509 \
	-nodes \
	-days 365 \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=PT/ST=Porto/L=Porto/O=42Porto/OU=42Porto/CN=www.nnuno-ca.42.fr"

# Defining 443 as the port that this container will listen to
EXPOSE 443

# Keeping the container alive thru a nginx command 
CMD ["nginx", "-g", "daemon off;"]
