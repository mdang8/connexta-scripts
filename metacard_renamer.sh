#!/bin/bash

DIR=~/Documents/test_metacards_2
REGEX="(?<=<TITLE>)(.*)(?=<\/TITLE>)"
i=1
echo "s/${REGEX}/metacard_${i}/"

for filename in $DIR/*; do
    echo $filename
    sed -i -- "s/${REGEX}/metacard_${i}/" $filename
    i=$(( i + 1 ))
done

