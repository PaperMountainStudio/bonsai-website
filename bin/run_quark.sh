#!/bin/sh

ip="$(ifconfig venet0:0 | grep -oE 'inet [0-9]+.[0-9]+.[0-9]+.[0-9]+' | sed 's/inet //')"
dir=${HOME}/bonsai-website/www
user=nobody
port=80

while sleep 5 ; do
    quark -h $ip -d $dir -p $port -u $user -l
done >>/tmp/quark_log \
    2>>/tmp/quark_err_log &
