#!/bin.bash


# check the user input is even or odd

read -p "enter the number " num

if (( "$num" % 2 == 0 ));
then 
	echo "$num is even"
else
	echo "$num is odd"
fi


