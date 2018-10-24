#!/bin/bash

# #############################################################
# ### This script can only activate JetBrains2017.2 series. ###
# #############################################################

if -f ~/Library/LaunchAgents/IntelliJIDEALicenseServer.plist; then
    echo 'IntelliJIDEALicenseServer already installed'
    exit 0
fi

cp ./assets/IntelliJIDEALicenseServer_darwin_amd64 /usr/local/bin/IntelliJIDEALicenseServer
tee ~/Library/LaunchAgents/IntelliJIDEALicenseServer.plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>KeepAlive</key>
        <false/>
        <key>RunAtLoad</key>
        <true/>
        <key>Label</key>
        <string>IntelliJIDEALicenseServer</string>
        <key>ProgramArguments</key>
            <array>
                <string>/usr/local/bin/IntelliJIDEALicenseServer</string>
                <string>-p</string>
                <string>1234</string>
                <string>-u</string>
                <string>$(basename $HOME)</string>
            </array>
    </dict>
</plist>
EOF
launchctl load -w ~/Library/LaunchAgents/IntelliJIDEALicenseServer.plist
