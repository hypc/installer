#!/bin/bash

brew list nginx >> /dev/null
if test "$?" = "0"; then
    echo 'Nginx already installed'
    exit 0
fi

brew install nginx
