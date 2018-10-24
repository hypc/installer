#!/bin/bash

brew list nginx >> /dev/null
if test "$?" = "0"; then
    echo 'nginx already installed'
    exit 0
fi

brew install nginx
