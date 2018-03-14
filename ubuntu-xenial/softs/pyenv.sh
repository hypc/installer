#!/bin/bash

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
tee ~/.pip/pip.conf <<EOF
[global]
index-url = http://mirrors.aliyun.com/pypi/simple/

[install]
trusted-host=mirrors.aliyun.com
EOF
