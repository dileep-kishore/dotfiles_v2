#!/bin/bash

if ! [ -x "$(command -v $EDITOR)" ]; then
    echo 'Error: $EDITOR is not set.' >&2
    exit 1
fi

if [ "Darwin" = $(uname -s) ]; then
    if ! [ -x "$(command -v pbcopy)" ]; then
        echo 'Error: pbcopy is not available.' >&2
        exit 1
    fi

    TMP=$(mktemp -t vimclip)
    $EDITOR $TMP
    if [ -s $TMP ]; then
        pbcopy <$TMP
    else
        rm $TMP
    fi
else
    if ! [ -x "$(command -v xsel)" ]; then
        echo 'Error: xsel is not available.' >&2
        exit 1
    fi

    TMP=$(mktemp -p /tmp -t vimclip_XXXXXXXX.md)
    $EDITOR $TMP
    if [ -s $TMP ]; then
        xsel -i -b <$TMP
    else
        rm $TMP
    fi
fi
