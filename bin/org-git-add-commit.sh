#!/usr/bin/env bash

ORG_PATH="$HOME/Documents/Org"

cd $ORG_PATH || exit 1

# Make sure main branch is checked out
if ! [[ $(git rev-parse --abbrev-ref HEAD) = "main" ]]
then
    echo "ERROR: main branch not checked out" >&2
    exit 1
fi

# Only run add/commit if there is anything to add
if [[ $(git status --porcelain) ]]
then
    git add --all . && git commit -q -a -m "Sync: $(date +"%Y-%m-%d %H:%M:%S")"
fi
