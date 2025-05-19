#!/bin/bash


# looping practise

<< comment
for ((i=0;i<=5;i++));
do
	mkdir "demoFile$i"
done

comment


<< comment

taking 3 arg. from 
1 -- folderName
2 -- start range
3 -- end range

comment


<< comment 
for (( i = $2 ; i<= $3; i++ ))
do
	mkdir "$1$i"
done

comment






