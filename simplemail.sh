#!/bin/bash

function createuser {
	if [ -d ./users/$1 ]; then
		echo "Error: This user already exists"
	else
		mkdir ./users/$1 
		echo $2 | cat > ./users/$1/pass.txt
	fi
}

function login {
	if [ -d ./users/$1 ]; then
		if [ "$2" = "$(cat ./users/$1/pass.txt)" ] ; then
			LOGIN=$1
			echo $LOGIN
		else
			echo "Error: Password incorrect" 
		fi
	else 
		echo "Error: This user doesn't exist"
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
		elif [ ${COMM[0]} = "login" ]; then
			login ${COMM[1]} ${COMM[2]}
		fi
done
