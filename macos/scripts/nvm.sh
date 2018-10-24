#!/bin/bash

if -d ~/.nvm; then
    echo 'nvm already installed'
    exit 0
fi

PROFILE=~/.profile

git clone https://github.com/creationix/nvm.git ~/.nvm
cat <<"EOF">> $PROFILE
## nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
NVM_IOJS_ORG_MIRROR=https://npm.taobao.org/mirrors/iojs
EOF
tee ~/.npmrc <<EOF
registry=https://registry.npm.taobao.org

chromedriver_cdnurl=https://npm.taobao.org/mirrors/chromedriver/
electron_mirror=https://npm.taobao.org/mirrors/electron/
phantomjs_cdnurl=https://npm.taobao.org/mirrors/phantomjs/
sass_binary_site=https://npm.taobao.org/mirrors/node-sass/
EOF

source $PROFILE
nvm install --lts
