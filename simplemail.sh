#!/bin/bash

function createuser {
	mkdir ./users/pedro
    cd ./users/pedro
	touch pass.txt 
	cat $2 > pass.txt
}

mkdir users
while [ 1 ]; do
		echo -n simplemail\>\ 
		read -a COMM
		if [ ${COMM[0]} = "quit" ]; then
			exit
		fi
done
