#!/bin/bash

# conditional statement


read -p "enter name : " userName

if [[ $userName == "prateek" ]];
then
	echo "user matched"
else
	echo "re-enter the correct user"
fi


