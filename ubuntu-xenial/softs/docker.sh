#!/bin/bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo tee /etc/apt/sources.list.d/docker-ce.list <<EOF
deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu xenial stable
EOF
sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates software-properties-common docker-ce
