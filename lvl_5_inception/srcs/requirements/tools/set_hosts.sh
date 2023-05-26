#!/bin/sh

NGINX_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nginx)

# Removing previous entrys
sed -i '/42.fr/d' /etc/hosts

# Write to 
sed -i '1i'$NGINX_IP' nnuno-ca.42.fr' /etc/hosts
sed -i '1i'$NGINX_IP' www.nnuno-ca.42.fr' /etc/hosts
sed -i '1i'$NGINX_IP' https://www.nnuno-ca.42.fr' /etc/hosts

cat /etc/hosts
