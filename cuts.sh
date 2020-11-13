#!/bin/bash

set -e

if [ ! -f "input.mp4" ]
then
    echo "File 'input.mp4' must exists"
    exit 1
fi

if [ ! -f "sets.csv" ]
then
    echo "File 'sets.csv' must exists"
    exit 1
fi

mkdir -p output

python3 ./cuts.py

echo 'Done!'
