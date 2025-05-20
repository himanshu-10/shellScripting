#!/bin/bash


if [ $(whoami)  == "root" ];
then 
	echo "you are root"
else
	echo "$(whoami)"
fi


