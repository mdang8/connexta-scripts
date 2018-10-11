#!/bin/bash

DEFAULT_NUMBER=251
# use default number if no command line argument given
NUMBER_OF_METACARDS=${1-$DEFAULT_NUMBER}
CDM_DIRECTORY_PATH=/tmp/cdm
FILENAME="metacard_test"

echo "Number of files to create: ${NUMBER_OF_METACARDS}"
sleep 1
echo

START_TIME=$SECONDS

for i in `seq 1 $NUMBER_OF_METACARDS`;
do
    echo "Created file \"${FILENAME}_$i.txt\""
    # fold alphanumeric output from /dev/urandom into lines every 20 characters and use first line
    echo $(cat /dev/urandom| LC_CTYPE=C tr -dc 'a-f0-9' | fold -w 20 | head -n 1) >> "${CDM_DIRECTORY_PATH}/${FILENAME}_$i.txt"
done

END_TIME=$SECONDS
echo "Created ${NUMBER_OF_METACARDS} files in $(( END_TIME - START_TIME  )) seconds."

