#!/bin/bash
#function createuser{
#	mkdir ./users/$1
#	touch pass.txt 
#	cat $2 > pass.txt
#}
while [ 1 ]; do
		echo -n simplemail\>\ 
		read COMM
		if [ $COMM = "quit" ]; then
			exit
		fi
done
