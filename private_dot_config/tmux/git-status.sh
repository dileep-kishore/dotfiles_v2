#!/bin/env bash

cd $1
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
STATUS=$(git status --porcelain 2>/dev/null | grep -E "^(M| M)" | wc -l)
if test "$BRANCH" != ""; then
    if test "$STATUS" = "0"; then
        echo "#[fg=green,bg=#1F1F28,nobold,noitalics,nounderscore]#[fg=#1F1F28,bg=green,bold,italics]  $BRANCH #[fg=#7E9CD8,bg=green,nobold,noitalics,nounderscore]"
    else
        echo "#[fg=red,bg=#1F1F28,nobold,noitalics,nounderscore]#[fg=#1F1F28,bg=red,bold,italics]  $BRANCH #[fg=#7E9CD8,bg=red,nobold,noitalics,nounderscore]"
    fi
else
    echo "#[fg=#7E9CD8,bg=#1F1F28,nobold,noitalics,nounderscore]"
fi
