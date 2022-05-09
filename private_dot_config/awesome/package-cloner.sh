#!/usr/bin/env bash

CURRDIR=$PWD
DOTFILES=$HOME/.dotfiles/private_dot_config/awesome
AWESOMEDIR=$HOME/.config/awesome

mkdir -p $HOME/.config/awesome/modules

function clone_pull() {
    if [ ! -d $AWESOMEDIR/$1 ]; then
        git clone $2 $AWESOMEDIR/$1
        ln -s $AWESOMEDIR/$1 $DOTFILES/$1
    else
        cd $AWESOMEDIR/$1
        git pull -f
        cd $CURRDIR
    fi
}

clone_pull collision https://github.com/Elv13/collision
clone_pull modules/smart_borders https://github.com/intrntbrn/smart_borders
clone_pull modules/lain https://github.com/lcpz/lain
clone_pull awesomewm-vim-tmux-navigator https://github.com/intrntbrn/awesomewm-vim-tmux-navigator
clone_pull modules/bling https://github.com/Nooo37/bling
clone_pull modules/rubato https://github.com/andOrlando/rubato
clone_pull awesome-wm-widgets https://github.com/streetturtle/awesome-wm-widgets
clone_pull awesome-buttons https://github.com/streetturtle/awesome-buttons

if [ ! -f $AWESOMEDIR/json.lua ]; then
    bash $DOTFILES/widgets/install-jsonlua.sh
fi

if [ ! -d $HOME/Downloads/spotify-cli ]; then
    bash $DOTFILES/widgets/install-spotifycli.sh
fi
