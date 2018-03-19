#!/bin/bash

curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo tee /etc/apt/sources.list.d/google-chrome.list <<EOF
deb http://dl.google.com/linux/chrome/deb/ stable main
EOF
sudo apt-get update && sudo apt-get install -y google-chrome-stable
