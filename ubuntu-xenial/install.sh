#!/bin/bash

cat <<"EOF">> ~/.bashrc
alias ls='ls --color=auto'
alias l='ls -aF'
alias ll='ls -alF'
alias lh='ls -alFh'
alias tree='tree -CF'
alias treel='tree -alF'
alias tailf='tail -f'
alias curli='curl -i'
alias curlw='curl -i -w "\n\n----------------\ntime_connect: %{time_connect}\ntime_starttransfer: %{time_starttransfer}\ntime_total: %{time_total}\n"'
alias grep='grep --color=auto'
alias pythonserver='python -m SimpleHTTPServer'
alias ssh_tunnel='ssh -qtnN -D 0.0.0.0:7070 root@45.77.101.132'
alias timestamp='date +%s'
alias timestamp16='echo "obase=16;$(date +%s)" | bc | tr "[:upper:]" "[:lower:]"'
HISTCONTROL=ignorespace:erasedups
HISTTIMEFORMAT="%F %T "
EOF

sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo sed -i 's/[a-z1-9.-]*.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
sudo apt-get update && sudo apt-get install -y build-essential git vim tree cmatrix curl wget screenfetch

softs=(vim nginx nvm chrome pyenv redis memcached postgresql mongodb docker java)
for soft in ${softs[*]}; do
    echo -ne "\033[31m"
    read -p "Do you want install $soft? [Y/N] (default: N) " q
    echo -ne "\033[0m"
    if test -o "$q" == "y" -o "$q" == "Y"; then
        bash ./softs/$soft.sh
    fi
    echo
done
