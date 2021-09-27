#!/bin/bash

function createuser {
	if [ -d ./users/$1 ]; then
		echo "Error: This user already exists"
	else
		mkdir ./users/$1 
		echo $2 | cat > ./users/$1/pass.txt
	fi
}

mkdir users
while [ 1 ]; do
		echo -n simplemail\>\ 
		read -a COMM
		if [ ${COMM[0]} = "quit" ]; then
			exit
		elif [ ${COMM[0]} = "creatuser" ]; then
			createuser ${COMM[1]} ${COMM[2]}
		fi
done
