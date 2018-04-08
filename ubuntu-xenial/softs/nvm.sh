#!/bin/bash

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

tee ~/.npmrc <<EOF
registry=https://registry.npm.taobao.org

chromedriver_cdnurl=https://npm.taobao.org/mirrors/chromedriver/
electron_mirror=https://npm.taobao.org/mirrors/electron/
phantomjs_cdnurl=https://npm.taobao.org/mirrors/phantomjs/
sass_binary_site=https://npm.taobao.org/mirrors/node-sass/
EOF
profile='~/.bashrc'
echo "NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node" >> $profile
echo "NVM_IOJS_ORG_MIRROR=https://npm.taobao.org/mirrors/iojs" >> $profile
source $profile
nvm install --lts
