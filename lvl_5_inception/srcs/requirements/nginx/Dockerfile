# Penultimate stable version: Debian 10 "buster" 
# https://www.debian.org/releases/
FROM debian:buster

LABEL maintainer="nnuno-ca@student.42porto.com"
LABEL version="1.0"
LABEL description="Nginx Docker image for the Inception 42 project"

RUN apt-get update -yq && apt-get upgrade -yq

# Install nginx and openssl
RUN apt install -yq nginx openssl

# Copy pre-designed config file to the container
COPY /config/nginx.conf /etc/nginx/

# Generate a self-signed certificate
RUN openssl req -x509 -nodes -sha256 -days 365 -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=PT/ST=Porto/L=Porto/O=42Porto/OU=42Porto/CN=www.nnuno-ca.42.fr"

# Defining 443 as the port that this container will listen to
EXPOSE 443

# Start Nginx in the foreground, disabling daemon mode,
# thus keeping the container alive
CMD ["nginx", "-g", "daemon off;"]
