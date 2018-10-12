#!/bin/bash

METACARD_DIRECTORY=~/Downloads/xml
CDM_DIRECTORY=/tmp/cdm

START_TIME=$SECONDS

for i in `seq 1 25`;
do
    cp ${METACARD_DIRECTORY}/*.xml $CDM_DIRECTORY
    echo "Copied 5 XML files to ${CDM_DIRECTORY}"
    sleep 5
done

END_TIME=$SECONDS

echo "\nFinished copying $(( 5 * 25 )) files in $(( END_TIME - START_TIME  )) seconds."

