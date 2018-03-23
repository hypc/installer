#!/bin/bash

# #############################################################
# ### This script can only activate JetBrains2017.2 series. ###
# #############################################################

sudo wget -O /usr/bin/IntelliJIDEALicenseServer https://oe5hf47m4.qnssl.com/IntelliJIDEALicenseServer/2017.2/IntelliJIDEALicenseServer_linux_amd64
sudo chmod a+x /usr/bin/IntelliJIDEALicenseServer
sudo tee /etc/systemd/system/IntelliJIDEALicenseServer.service <<EOF
[Unit]
Description=IntelliJIDEALicenseServer

[Service]
ExecStart=/usr/bin/IntelliJIDEALicenseServer -p 1234 -u $(basename $HOME)
EOF

sudo systemctl enable IntelliJIDEALicenseServer.service
sudo systemctl daemon-reload
sudo systemctl start IntelliJIDEALicenseServer.service
