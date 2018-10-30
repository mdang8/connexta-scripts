#!/bin/bash

DEFAULT_NUM=5
# use default number if no command line argument given
NUM_OF_METACARDS=${1-$DEFAULT_NUM}
CDM_DIR_PATH=/tmp/cdm
FILENAME="dup_metacard_test"

echo "Number of files to duplicate: ${NUM_OF_METACARDS}"
sleep 1
echo

START_TIME=$SECONDS

for i in `seq 1 $NUM_OF_METACARDS`;
do
    DUP_TEXT=$( cat /dev/urandom| LC_CTYPE=C tr -dc 'a-f0-9' | fold -w 20 | head -n 1  )

    for j in `seq 1 2`;
    do
        DUP_FILENAME="${CDM_DIR_PATH}/${FILENAME}_${i}_${j}.txt"
        echo "Duplicate text: ${DUP_TEXT}"
        echo $DUP_TEXT >> $DUP_FILENAME
        echo "Created file \"$DUP_FILENAME\""
    done
done

END_TIME=$SECONDS
echo "Created ${NUM_OF_METACARDS} duplicate files in $(( END_TIME - START_TIME )) seconds."

