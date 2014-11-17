#!/bin/bash

for FILE in $(find . -maxdepth 1 -name '\.[^\.]*')
do
    test "$FILE" != ".git" \
        && ln -s $PWD/$FILE ~/
done
