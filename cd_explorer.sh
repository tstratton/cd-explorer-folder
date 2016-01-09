#!/bin/bash

#LINES=($(explorer_folders.exe))
#LINES=($(cmd /c cde.exe))

OUTFILE=~/bin/cde-out.txt

list-explorer-folders.exe > $OUTFILE
dos2unix.exe -q $OUTFILE
LINES=($(cat $OUTFILE))

## replace space with %20, to avoid separate array elements
DESKTOP=${USERPROFILE// /%20}/Desktop

## append to array after converting backslash to slash
LINES=( ${LINES[@]-} "${DESKTOP//\\//}" )

## the size of array (or first unused index)
#echo ${#LINES[@]} 

#echo $LINES

COUNT=0
if [ -z "$1" ]; then
	for LINE in "${LINES[@]}"
	do
		## remove file:/// for local folders
		LINE=${LINE/file:\/\/\/}
		## remove file:// for network folders
		LINE=${LINE/file:/}	
		## replace %20 with spaces
		LINE=${LINE//\%20/ }
		echo "$COUNT: $LINE"
		let "COUNT += 1"
	done
else
	LINE=${LINES[$1]}
	## remove file:/// for local folders
	LINE=${LINE/file:\/\/\/}
	## remove file:// for network folders
	LINE=${LINE/file:/}	
	## replace %20 with spaces
	LINE=${LINE//\%20/ }
	echo $LINE
	unset LINES
	LINE="$LINE"
	if [ -d "$LINE" ]; then
		cd "$LINE"
	else
		echo "Error! invalid directory name"
	fi
fi
