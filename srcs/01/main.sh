#!/bin/bash

function arg_is_digit {
arg=$1
is_digit=1
for (( i = 0; $i < ${#arg}; i = $(($i+1)) ))
do
	if ! [[ ${arg:$i:1} = [[:digit:]] ]]
	then
		is_digit=0
	fi
done
echo $(( $is_digit ))
}

if ! [[ -z $1 || $( arg_is_digit $1 ) -eq 1 ]]
then
	echo $1
else
	echo "error: invalid parameter"
fi

