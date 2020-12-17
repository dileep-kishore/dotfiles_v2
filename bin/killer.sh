#!/usr/bin/env bash

. /home/dileep/.dotfiles/i3/./password.sh

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
    echo $MY_PASSWORD | sudo -S chattr +i /etc/resolv.conf
    echo $MY_PASSWORD | sudo -S chattr +i /etc/hosts
    echo $MY_PASSWORD | sudo -S chattr +i ~/.dotfiles/i3/killer.sh
    echo $MY_PASSWORD | sudo -S chattr +i ~/.dotfiles/i3/shutter.py
    echo $MY_PASSWORD | sudo -S chattr +i ~/.dotfiles/i3/cron_shutter.py
    python $HOME/.dotfiles/i3/shutter.py /etc/resolv.conf /etc/hosts $HOME/.dotfiles/i3/killer.sh $HOME/.dotfiles/i3/cron_shutter.py
    sleep 10
done

exit 0
