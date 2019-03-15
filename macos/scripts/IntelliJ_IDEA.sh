#!/bin/bash

if test -d "/Applications/IntelliJ IDEA.app"; then
    echo 'IntelliJ IDEA already installed'
    exit 0
fi
curl -o ~/Downloads/ideaIU.dmg https://download.jetbrains.com/idea/ideaIU-2017.2.7.dmg
hdiutil attach -quiet ~/Downloads/ideaIU.dmg
cp -r "/Volumes/IntelliJ IDEA/IntelliJ IDEA.app" /Applications/
