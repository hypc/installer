#!/bin/bash

# #############################################################
# ### This script can only activate JetBrains2017.2 series. ###
# #############################################################

sudo wget -O /usr/local/bin/IntelliJIDEALicenseServer https://oe5hf47m4.qnssl.com/IntelliJIDEALicenseServer/2017.2/IntelliJIDEALicenseServer_linux_amd64
sudo chmod a+x /usr/local/bin/IntelliJIDEALicenseServer
sudo tee /etc/systemd/system/IntelliJIDEALicenseServer.service <<EOF
[Unit]
Description=IntelliJIDEALicenseServer
After=network-online.target
Wants=network-online.target

[Service]
ExecStart=/usr/local/bin/IntelliJIDEALicenseServer -p 1234 -u $(basename $HOME)
Restart=on-failure
EOF

sudo systemctl enable IntelliJIDEALicenseServer.service
sudo systemctl daemon-reload
sudo systemctl start IntelliJIDEALicenseServer.service
