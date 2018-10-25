#!/bin/bash

METACARD_DIR=~/Downloads/xml
CDM_DIR=/tmp/cdm

count_files_in_dir () {
    return $( ls -l $1 | wc -l )
}

main () {
    NUM_FILES_IN_METACARD_DIR=$( count_files_in_dir $METACARD_DIR )
    START_TIME=$SECONDS

    for i in `seq 1 25`;
    do
        # counts the # of lines in the ls output for the CDM directory
        NUM_FILES_IN_CDM_DIR=$( count_files_in_dir $CDM_DIR )
        # sleep for 1 seconds and check for empty directory
        while [ $NUM_FILES_IN_CDM_DIR -gt 0 ]
        do
            sleep 1
            NUM_FILES_IN_CDM_DIR=$( count_files_in_dir $CDM_DIR )
        done

        # copies the XML files and sleeps for 5 seconds to wait for the metacards to be ingested and moved
        cp ${METACARD_DIR}/*.xml $CDM_DIR
        echo "Copied ${NUM_FILES_IN_METACARD_DIR} XML files to ${CDM_DIR}"
        sleep 5
    done

    END_TIME=$SECONDS

    echo "Finished copying $(( 5 * 25 )) files in $(( END_TIME - START_TIME  )) seconds."
}

main
exit 0
