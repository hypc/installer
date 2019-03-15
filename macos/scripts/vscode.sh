#!/bin/bash

if test -d "/Applications/Visual Studio Code.app"; then
    echo 'VSCode already installed'
    exit 0
fi

curl -L -o ~/Downloads/VSCode-darwin-stable.zip https://go.microsoft.com/fwlink/?LinkID=620882
unzip ~/Downloads/VSCode-darwin-stable.zip
mv "Visual Studio Code.app" /Applications/
