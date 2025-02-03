#! /bin/bash

sudo apt update -y

sudo curl -fsSL https://get.docker.com | sh

sudo usermod -aG docker ubuntu

sudo systemctl enable docker
sudo systemctl start docker

sudo mkdir -p /opt/dockerfiles/nginx
sudo touch /opt/dockerfiles/nginx/index.html
sudo echo "Hola Curso !!" | sudo tee /opt/dockerfiles/nginx/index.html > /dev/null

sudo docker run -d --name nginx \
    -v /opt/dockerfiles/nginx:/usr/share/nginx/html \
    -p 80:80 \
    nginx:1.27
