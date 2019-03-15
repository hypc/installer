#!/bin/bash

if test -d "/Applications/PyCharm.app"; then
    echo 'PyCharm already installed'
    exit 0
fi
curl -o ~/Downloads/pycharm.dmg https://download.jetbrains.com/python/pycharm-professional-2017.2.7.dmg
hdiutil attach -quiet ~/Downloads/pycharm.dmg
cp -r /Volumes/PyCharm/PyCharm.app /Applications/
