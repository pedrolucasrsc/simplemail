#!/bin/bash

function createuser {
	if [ -d ./simplemail/users/$1 ]; then
		echo "Error: This user already exists"
	else
        mkdir ./simplemail/users/$1 
		echo $2 | cat > ./simplemail/users/$1/pass.txt
	fi
}

function login {
	if [ -d ./simplemail/users/$1 ]; then
        if [ "$2" = "$(cat ./simplemail/users/$1/pass.txt)" ] ; then
			LOGIN=$1
			echo $LOGIN
		else
			echo "Error: Password incorrect" 
		fi
	else 
		echo "Error: This user doesn't exist"
	fi
}

function passwd {
    if [ -d ./simplemail/users/$1 -a "$2" = "$(cat ./simplemail/users/$1/pass.txt)" ]; then
        echo $3 | cat > ./simplemail/users/$1/pass.txt
    else
        echo "Error: Username or Password incorrect"
    fi
}

if [ ! -d ./simplemail ]; then
    mkdir ./simplemail
fi
if [ ! -d ./simplemail/users ]; then
    mkdir ./simplemail/users
fi
while [ true ]; do
		echo -n simplemail\>\ 
		read -a COMM
		if [ ${COMM[0]} = "quit" ]; then
			exit
		elif [ ${COMM[0]} = "createuser" ]; then
			createuser ${COMM[1]} ${COMM[2]}
		elif [ ${COMM[0]} = "login" ]; then
			login ${COMM[1]} ${COMM[2]}
        elif [ ${COMM[0]} = "passwd" ]; then
            passwd ${COMM[1]} ${COMM[2]} ${COMM[3]}
		fi
done
