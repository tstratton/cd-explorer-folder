#!/bin/sh

#LINES=($(explorer_folders.exe))
#LINES=($(cmd /c cde.exe))

explorer_folders.exe > ~/bin/cde-out.txt
LINES=($(cat ~/bin/cde-out.txt))


## replace space with %20, to avoid separate array elements
DESKTOP=${USERPROFILE// /%20}/Desktop

## append to array after converting backslash to slash
LINES=( ${LINES[@]-} $(echo "${DESKTOP//\\//}") )

## the size of array (or first unused index)
#echo ${#LINES[@]} 

#echo $LINES

COUNT=0
if [ -z ${1}  ]; then
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
	cd "$LINE"
fi
