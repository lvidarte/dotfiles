#!/bin/bash

for FILE in $(find . -maxdepth 1 -name '\.[^\.]*')
do
    ln -s $PWD/$FILE ~/
done
