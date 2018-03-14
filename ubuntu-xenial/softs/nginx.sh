#!/bin/bash

curl -fsSL http://nginx.org/keys/nginx_signing.key | sudo apt-key add -
sudo tee /etc/apt/sources.list.d/nginx.list <<EOF
deb http://nginx.org/packages/ubuntu/ xenial nginx
deb-src http://nginx.org/packages/ubuntu/ xenial nginx
EOF
sudo apt-get update && sudo apt-get install -y nginx
