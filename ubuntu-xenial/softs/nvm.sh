#!/bin/bash

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
profiles=(~/.bash_profile ~/.zshrc ~/.profile ~/.bashrc)
for profile in ${profiles[*]}; do
    if test -f $profile; then
        break
    fi
done
echo "NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node" >> $profile
echo "NVM_IOJS_ORG_MIRROR=https://npm.taobao.org/mirrors/iojs" >> $profile
tee ~/.npmrc <<EOF
registry=https://registry.npm.taobao.org
chromedriver_cdnurl=https://npm.taobao.org/mirrors/chromedriver
sass_binary_site=https://npm.taobao.org/mirrors/node-sass/
EOF
source $profile
nvm install --lts
