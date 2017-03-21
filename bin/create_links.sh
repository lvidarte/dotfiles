#!/bin/bash

for FILE in $(find . -maxdepth 1 -name '\.[^\.]*')
do
    DOTFILE=$(echo $FILE | sed 's/\.\///' -)
    test "$DOTFILE" != ".git" \
        && ln -s $PWD/$DOTFILE ~/
done
