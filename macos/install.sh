#!/bin/bash

cat <<"EOF">> $PROFILE
export TERM="xterm-color"
PS1='\[\e[0;33m\e[1m\]\u\[\e[0m\]@\[\e[0;32m\e[1m\]\h\[\e[0m\]:\[\e[0;34m\e[1m\]\w\[\e[0m\]\$ '
HISTCONTROL=ignorespace:erasedups
HISTTIMEFORMAT="%F %T "

alias ls='ls -G'
alias l='ls -lF'
alias ll='ls -alF'
alias lh='ls -alFh'
alias mkdir='mkdir -p'
alias tree='tree -CF'
alias treel='tree -alF'
alias tailf='tail -f'
alias curli='curl -i'
alias curlw='curl -i -w "\n\n----------------\ntime_connect: %{time_connect}\ntime_starttransfer: %{time_starttransfer}\ntime_total: %{time_total}\n"'
alias grep='grep --color=auto'
alias pythonserver='python -m SimpleHTTPServer'
alias timestamp='date +%s'
alias timestamp16='echo "obase=16;$(date +%s)" | bc | tr "[:upper:]" "[:lower:]"'
function cd(){ command cd "$@"; l; }
alias ~='cd ~'
alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'

alias which='type -all'
alias path='echo -e ${PATH//:/\\n}'
trash () { command mv "$@" ~/.Trash ; }
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias memHogsTop='top -l 1 -o rsize | head -20' 
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias cpuHogsPs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
alias ttop='top -R -F -s 10 -o rsize'
EOF
tee ~/.inputrc <<EOF
set completion-ignore-case on
EOF
tee ~/.gitconfig <<EOF
[alias]
    s="status"
    a="!git add . && git status"
    au="!git add -u . && git status"
    aa="!git add . && git add -u . && git status"
    c="commit"
    cm="commit -m"
    ca="commit --amend"
    ac="!git add . && git commit"
    acm="!git add . && git commit -m"
    l="log --graph --all --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %s %C(white)- %an, %ar%Creset'"
    ll="log --stat --abbrev-commit"
    lg="log --color --graph --pretty=format:'%C(bold white)%h%Creset -%C(bold green)%d%Creset %s %C(bold green)(%cr)%Creset %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
    llg="log --color --graph --pretty=format:'%C(bold white)%H %d%Creset%n%s%n%+b%C(bold blue)%an <%ae>%Creset %C(bold green)%cr (%ci)' --abbrev-commit"
    d="diff"
    master="checkout master"

[core]
    editor=vim

[credential]
    helper=store
EOF

which brew >> /dev/null
if test "$?" != "0"; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if test "$?" != "0"; then
        echo "brew安装失败"
        exit 1
    fi
    brew install tree cmatrix
fi
