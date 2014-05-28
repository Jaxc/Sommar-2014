#!/bin/bash

if [ -z "$1" ]
then 
	echo "no input argument, write \"bash makerun.sh --help\" for help"
else
	if [ $1 == "--help" ]
	then
		echo "usage: \"bash makerun.sh m t\""
		echo "example: \"bash makerun.sh 4 1\""
	else
		bash script/bashscript.sh $1 $2
	fi
fi


