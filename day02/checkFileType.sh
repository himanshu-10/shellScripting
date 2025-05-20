#!/bin/bash

if  (( $# != 1 ));
then 
	echo "error : Invalid argumrnts, pass the file name"
	exit 1
fi


file=$1

if   [[ -f "$file" ]];
then 
	echo "$file is regular file"
elif [[ -L "$file" ]];
then 
	echo "$file id soft link"
elif [[ -d "$file" ]];
then
	echo "$file is a directory"
else
	echo "$file does not exit"
fi

