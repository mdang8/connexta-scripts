#!/bin/bash

METACARD_DIR=~/Downloads/xml
CDM_DIR=/tmp/cdm

START_TIME=$SECONDS

for i in `seq 1 25`;
do
    # counts the # of lines in the ls output for the CDM directory
    NUM_FILES_IN_CDM_DIR=$(( ls -l CDM_DIR | wc -l ))
    # sleep for 1 seconds and check for empty directory
    while [ $NUM_FILES_IN_CDM_DIR -gt 0 ]
    do
        sleep 1
        NUM_FILES_IN_CDM_DIR=$(( ls -l CDM_DIR | wc -l ))
    done

    # copies the XML files and sleeps for 5 seconds to wait for the metacards to be ingested and moved
    cp ${METACARD_DIR}/*.xml $CDM_DIR
    echo "Copied 5 XML files to ${CDM_DIR}"
    sleep 5
done

END_TIME=$SECONDS

echo "Finished copying $(( 5 * 25 )) files in $(( END_TIME - START_TIME  )) seconds."

