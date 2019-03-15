#!/bin/bash

if test -d "/Applications/Google Chrome.app"; then
    echo 'Chrome already installed'
    exit 0
fi

curl -o ~/Downloads/googlechrome.dmg https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
hdiutil attach -quiet ~/Downloads/googlechrome.dmg
cp -r "/Volumes/Google Chrome/Google Chrome.app" /Applications/
