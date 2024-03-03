#!/bin/bash

if [ $# -lt 2 ]; then
	echo "not enough paramenters are specified"
	exit 1
fi

filesdir=$(realpath $1)
searchstr=$2

if [ ! -d $filesdir ]; then
	echo "path does not exist or not a directory"
	exit 1
fi

x=$(find $filesdir -type f | wc -l)
y=$(grep -no $searchstr $(find $filesdir -type f) 2> /dev/null | uniq | wc -l)

echo "The number of files are $x and the number of matching lines are $y"
exit 0
