#!/bin/bash

create_directory(){

	mkdir demo
}

if ! create_directory; 
then
	echo "directory is already created"
	exit 1
fi

echo "directory is successfully created"

