#!/bin/bash

if [ -n "${DEBUG}" ];
then
    echo "Debug Mode, display commands & dry-run (no actual modifications to files)."
    set -x
fi

if [ -z "${1}" ] || [ -d "${1}" ];
then
    WORKDIR="${1}"
else
    WORKDIR="."
fi 


find "${WORKDIR}" -type f -not -path "./.git/*" -print0 | while IFS= read -r -d '' file_name
do
    isTextFile=$(file --no-buffer -i "${file_name}" )
    if [[ "${isTextFile}" =~ ".* text/plain;.*" ]];
    then
        echo "${file_name} skipped (not text),"
        continue;
    fi

    if [ -n "${DEBUG}" ];
    then
        echo "Skip ${file_name}, debug is dry-run mode."
        continue;
    fi

    ## Solution found as part of this stackoverflow discussion: https://stackoverflow.com/questions/151677/tool-for-adding-license-headers-to-source-files
    head "-${COPYRIGHTLEN}" "${file_name}" | diff copyright.txt - || ( ( cat copyright.txt; echo; cat "${file_name}") > /tmp/file;  \
        mv /tmp/file "${file_name}" )  
done 


