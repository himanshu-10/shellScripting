#!/bin/bash

# via argument , we take input and do some if else 
# age < 13 --> kid
# age >= 13 && age <= 19 --> teen
# age > 19 --> adult

age=$1

if (( $age < 13  ));
then 
	echo "you are kid"
elif (( $age >= 13 && $age <= 19 ))
then
	echo "you are teen"
else
	echo "you are adult"
fi

