#!/bin/env bash

cd $1
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
STATUS=$(git status --porcelain 2>/dev/null | egrep "^(M| M)" | wc -l)
if test "$BRANCH" != ""; then
    if test "$STATUS" = "0"; then
        echo "#[fg=green,bg=#1a1b26,nobold,noitalics,nounderscore]#[fg=#1a1b26,bg=green,bold,italics]  $BRANCH #[fg=#7aa2f7,bg=green,nobold,noitalics,nounderscore]"
    else
        echo "#[fg=red,bg=#1a1b26,nobold,noitalics,nounderscore]#[fg=#1a1b26,bg=red,bold,italics]  $BRANCH #[fg=#7aa2f7,bg=red,nobold,noitalics,nounderscore]"
    fi
fi
