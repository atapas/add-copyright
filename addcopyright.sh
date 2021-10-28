#!/bin/bash

## Solution found as part of this stackoverflow discussion: https://stackoverflow.com/questions/151677/tool-for-adding-license-headers-to-source-files

for x in $*; do  
head -$COPYRIGHTLEN $x | diff copyright.txt - || ( ( cat copyright.txt; echo; cat $x) > /tmp/file;  
mv /tmp/file $x )  
done 
