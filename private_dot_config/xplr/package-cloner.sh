#!/bin/bash

CURRDIR=$PWD
DOTFILES=$HOME/.dotfiles/private_dot_config/xplr/plugins
XPLRDIR=$HOME/.config/xplr/plugins

mkdir -p $HOME/.config/xplr/plugins

function clone_pull() {
    if [ ! -d $XPLRDIR/$1 ]; then
        git clone $2 $XPLRDIR/$1
        ln -s $XPLRDIR/$1 $DOTFILES/$1
    else
        cd $XPLRDIR/$1
        git pull -f
        cd $CURRDIR
    fi
}

clone_pull fzf https://github.com/sayanarijit/fzf.xplr
clone_pull dua-cli https://github.com/sayanarijit/dua-cli.xplr
clone_pull preview-tabbed https://github.com/sayanarijit/preview-tabbed.xplr
clone_pull icons https://github.com/prncss-xyz/icons.xplr
clone_pull trash-cli https://github.com/sayanarijit/trash-cli.xplr
clone_pull zoxide https://github.com/sayanarijit/zoxide.xplr
clone_pull xclip https://github.com/sayanarijit/xclip.xplr
clone_pull dual-pane https://github.com/sayanarijit/dual-pane.xplr
clone_pull map https://github.com/sayanarijit/map.xplr
