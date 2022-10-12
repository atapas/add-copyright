#!/bin/bash

declare -A applyRE
declare -A addpre
declare -A addpost

addpre[c]='/*'
applyRE[c]='s/^/ * /'
addpost[c]=' */'

applyRE[shell]='s/^/# /'
applyRE[matlab]='s/^/% /'
applyRE[lua]='s/^/-- /'

if [[ x$1 == x ]]; then
    echo 'Must provide comments style as first argument' >&2
    exit 1
elif [[ -v "applyRE[$1]" ]] ; then
    STYLE=$1
else
    echo "Unknown style"
    exit 2
fi

if [[ x$2 == x ]]; then
    # Apply to all files, excluding directories
    FILES=$(find . -type f)
else
    D=$(dirname "$2")
    F="${2#${D}/}"
    FILES=$(find $D -type f -name "$F" -print)
fi


tmpcopyright=$(mktemp /tmp/addcopyright.XXXXXX)

if [[ -v "addpre[$STYLE]" ]] ; then echo "${addpre[$STYLE]}" > $tmpcopyright ; fi
sed "${applyRE[$STYLE]}" < copyright.txt >> $tmpcopyright
if [[ -v "addpost[$STYLE]" ]] ; then echo "${addpost[$STYLE]}" >> $tmpcopyright; fi
COPYRIGHTLEN=$(wc -l < $tmpcopyright)

# Solution found as part of this stackoverflow discussion:
# https://stackoverflow.com/questions/151677/tool-for-adding-license-headers-to-source-files
for x in $FILES; do
    tmpsrcfile=$(mktemp /tmp/addcopyright.XXXXXX)
    head -$COPYRIGHTLEN $x | diff -q $tmpcopyright - > /dev/null
    if [[ $? == 1 ]]; then
	(cat $tmpcopyright; cat $x) > $tmpsrcfile
	mv $tmpsrcfile $x
    fi
done

#rm -f $tmpcopyright $tmpsrcfile

exit 0
