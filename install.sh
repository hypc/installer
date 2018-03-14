#!/bin/bash

if test "$(uname)" = "Darwin"; then
    cd osx && bash install.sh
elif test $(uname -a | grep -ci ubuntu) -gt 0; then
    cd ubuntu-$(lsb_release -cs) && bash install.sh
elif test $(cat /proc/version | grep -ci centos) -gt 0; then
    cd centos && bash install.sh
fi
