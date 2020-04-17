#!/bin/bash  
for x in $*; do  
head -$LICENSELEN $x | diff license.txt - || ( ( cat license.txt; echo; cat $x) > /tmp/file;  
mv /tmp/file $x )  
done 