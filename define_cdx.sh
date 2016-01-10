#!/bin/bash

function cdx() {
    EXE_NAME="$HOME/bin/list-explorer-paths.exe"
    if [ -z "$1" ]; then
        "$EXE_NAME"
    else
        RESULT=$("$EXE_NAME" "$1");
        if [ -d "$RESULT" ]; then
            cd "$RESULT"
        fi
    fi
}
