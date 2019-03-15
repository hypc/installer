#!/bin/bash

if test -d "/Applications/WebStorm.app"; then
    echo 'WebStorm already installed'
    exit 0
fi
curl -o ~/Downloads/webstorm.dmg https://download.jetbrains.com/webstorm/WebStorm-2017.2.6.dmg
hdiutil attach -quiet ~/Downloads/webstorm.dmg
cp -r /Volumes/WebStorm/WebStorm.app /Applications/
