#! /bin/bash

# Actualizar paquetes
sudo apt update -y

curl -fsSL https://get.docker.com | sh

sudo usermod -aG docker ${USER}

sudo mkdir -p /opt/dockerfiles/nginx

sudo docker run -d --name nginx \
    -p 80:80 \
    nginx:1.27

