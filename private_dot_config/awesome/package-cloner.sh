#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles/private_dot_config/awesome
AWESOMEDIR=$HOME/.config/awesome

if [ ! -d $AWESOMEDIR/collision ]; then
    git clone https://github.com/Elv13/collision $AWESOMEDIR/modules/collision
    ln -s $AWESOMEDIR/collision $DOTFILES/modules/collision
fi

if [ ! -d $AWESOMEDIR/smart_borders ]; then
    git clone https://github.com/intrntbrn/smart_borders $AWESOMEDIR/modules/smart_borders
    ln -s $AWESOMEDIR/smart_borders $DOTFILES/modules/smart_borders
fi

if [ ! -d $AWESOMEDIR/lain ]; then
    git clone https://github.com/lcpz/lain $AWESOMEDIR/modules/lain
    ln -s $AWESOMEDIR/lain $DOTFILES/modules/lain
fi

if [ ! -d $AWESOMEDIR/awesomewm-vim-tmux-navigator ]; then
    git clone https://github.com/intrntbrn/awesomewm-vim-tmux-navigator $AWESOMEDIR/awesomewm-vim-tmux-navigator
    ln -s $AWESOMEDIR/awesomewm-vim-tmux-navigator $DOTFILES/awesomewm-vim-tmux-navigator
fi
