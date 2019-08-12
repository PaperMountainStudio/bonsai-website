#!/bin/sh

apt update
apt install git make curl gcc rsync sudo vim less

groupadd nobody
useradd nobody

cat > ~/.profile << EOF
clear ; ls
alias l=ls
alias ll='ls -l'
alias c=clear
alias bonsai="~/bonsai/bonsai --hosts-curl"
alias bs=bonsai
alias mkd=mkdir
alias recomp="cd ~/bonsai ; make clean ; make ; make install ; cd -"
set -o vi
export EDITOR=vim
EOF

cd /tmp
git clone http://git.suckless.org/quark
cd quark
make
make install

cd /tmp
git clone http://github.com/dylanaraps/neofetch
cd neofetch
make
make install

cd /tmp
git clone http://github.com/dylanaraps/fff
cd fff
make
make install

rm -rf /tmp/quark /tmp/neofetch /tmp/fff

# ---

cd ${HOME}

git clone http://bonsai-linux.org/website
sh ~/bonsai-website/bin/run_quark.sh

# ---

git clone http://github.com/bonsai-linux/bonsai
git clone http://github.com/bonsai-linux/tools
git clone http://github.com/mitchweaver/bin
