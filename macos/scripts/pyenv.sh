#!/bin/bash

if test -d ~/.pyenv; then
    echo 'pyenv already installed'
    exit 0
fi

PROFILE=~/.profile

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
cat <<"EOF">> $PROFILE
## pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"
EOF
mkdir -p ~/.pip tee ~/.pip/pip.conf <<EOF
[global]
index-url=https://mirrors.aliyun.com/pypi/simple/

[install]
trusted-host=mirrors.aliyun.com
EOF

brew list zlib >> /dev/null
if test "$?" != "0"; then
    brew install zlib
fi
cat <<"EOF">> $PROFILE
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
EOF
brew list sqlite >> /dev/null
if test "$?" != "0"; then
    brew install sqlite
fi
cat <<"EOF">> $PROFILE
export LDFLAGS="-L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/sqlite/include"
EOF
