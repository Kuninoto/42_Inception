# Penultimate stable version: Debian 10 "buster" 
# https://www.debian.org/releases/
FROM debian:10.13

# refresh && update system repositories
# -yq yes quiet
RUN apt-get update -yq && apt-get upgrade -yq

# install nginx
RUN apt-get install nginx -yq

# Defining 443 as the port that this container will listen to
EXPOSE 443

# Keeping the container alive thru a nginx command 
CMD ["nginx", "-g", "daemon off;"]