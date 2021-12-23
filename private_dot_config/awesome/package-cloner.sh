#!/usr/bin/env bash

AWESOMEDIR=$HOME/.config/awesome

if [ ! -d $AWESOMEDIR/collision ]; then
    git clone https://github.com/Elv13/collision $AWESOMEDIR/collision
fi

if [ ! -d $AWESOMEDIR/smart_borders ]; then
    git clone https://github.com/intrntbrn/smart_borders $AWESOMEDIR/smart_borders
fi

if [ ! -d $AWESOMEDIR/lain ]; then
    git clone https://github.com/lcpz/lain $AWESOMEDIR/lain
fi

if [ ! -d $AWESOMEDIR/awesomewm-vim-tmux-navigator ]; then
    git clone https://github.com/intrntbrn/awesomewm-vim-tmux-navigator $AWESOMEDIR/awesomewm-vim-tmux-navigator
fi
