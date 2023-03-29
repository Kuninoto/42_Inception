# Penultimate stable version: Debian 10 "buster" 
# https://www.debian.org/releases/
FROM debian:10.13

RUN echo "Updating the container..."

# -yq yes quiet
RUN apt-get update -yq && apt-get upgrade -yq

RUN echo "Done!"

# install nginx
RUN apt-get install nginx -yq

# copy pre-designed config file to the right folder 
# inside the container
COPY /config/nginx.conf /etc/nginx/

# Defining 443 as the port that this container will listen to
EXPOSE 443

# Keeping the container alive thru a nginx command 
CMD ["nginx", "-g", "daemon off;"]