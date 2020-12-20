#!/usr/bin/env bash

while true
do
    pkill firefox
    pkill palemoon
    pkill google-chrome
    pkill chromium
    pkill vivaldi
    pkill midori
    pkill qutebrowser
    pkill seamonkey
    pkill opera-beta
    pkill opera
    pkill steam
    python $HOME/.dotfiles/bin/shutter.py /etc/resolv.conf /etc/hosts $HOME/.dotfiles/bin/killer.sh $HOME/.dotfiles/bin/cron_shutter.py
    sleep 10
done

exit 0
