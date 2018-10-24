#!/bin/bash

if -d ~/.vim; then
    echo 'vim already installed'
    exit 0
fi

curl -o- https://raw.githubusercontent.com/hypc/vimfiles/master/install.simple.sh | bash
