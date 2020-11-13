#!/bin/bash

set -e

mkdir -p input

if [ -z "$(ls -A ./input)" ]
then
    echo "Directory 'input' is empty"
    exit 1
fi

if [ "$(ls -A ./input | wc -l)" -eq "1" ]
then
    echo "Directory 'input' has one file: creating a symbolic link"
    ln -s ./input/* input.mp4
else
    echo "Directory 'input' has more than one file: concatenating"
    
    touch list.txt
    > list.txt

    for f in ./input/*
    do
        echo "file  '$f'" >> list.txt  
    done

    ffmpeg -y -f concat -safe 0 -i list.txt -c copy input.mp4
fi

echo "Done!"
