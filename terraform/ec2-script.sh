#! /bin/bash

# Actualizar paquetes
sudo apt update -y

curl -fsSL https://get.docker.com | sh

sudo usermod -aG docker ${USER}

sudo systemctl enable docker
sudo systemctl start docker

mkdir -p /opt/dockerfiles/nginx
touch /opt/dockerfiles/nginx/index.html
echo "Hola Curso" | sudo tee /opt/dockerfiles/nginx/index.html > /dev/null
echo "1"

sudo docker run -d --name nginx \
    -v /opt/dockerfiles/nginx:/usr/share/nginx/html
    -p 80:80 \
    nginx:1.27

