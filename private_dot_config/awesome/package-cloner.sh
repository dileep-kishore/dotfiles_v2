#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles/private_dot_config/awesome
AWESOMEDIR=$HOME/.config/awesome

if [ ! -d $AWESOMEDIR/modules/collision ]; then
    git clone https://github.com/Elv13/collision $AWESOMEDIR/collision
    ln -s $AWESOMEDIR/collision $DOTFILES/collision
fi

if [ ! -d $AWESOMEDIR/modules/smart_borders ]; then
    git clone https://github.com/intrntbrn/smart_borders $AWESOMEDIR/modules/smart_borders
    ln -s $AWESOMEDIR/modules/smart_borders $DOTFILES/modules/smart_borders
fi

if [ ! -d $AWESOMEDIR/modules/lain ]; then
    git clone https://github.com/lcpz/lain $AWESOMEDIR/modules/lain
    ln -s $AWESOMEDIR/modules/lain $DOTFILES/modules/lain
fi

if [ ! -d $AWESOMEDIR/awesomewm-vim-tmux-navigator ]; then
    git clone https://github.com/intrntbrn/awesomewm-vim-tmux-navigator $AWESOMEDIR/awesomewm-vim-tmux-navigator
    ln -s $AWESOMEDIR/awesomewm-vim-tmux-navigator $DOTFILES/awesomewm-vim-tmux-navigator
fi

if [ ! -d $AWESOMEDIR/modules/bling ]; then
    git clone https://github.com/Nooo37/bling $AWESOMEDIR/modules/bling
    ln -s $AWESOMEDIR/modules/bling $DOTFILES/modules/bling
fi

if [ ! -d $AWESOMEDIR/modules/rubato ]; then
    git clone https://github.com/andOrlando/rubato $AWESOMEDIR/modules/rubato
    ln -s $AWESOMEDIR/modules/rubato $DOTFILES/modules/rubato
fi
