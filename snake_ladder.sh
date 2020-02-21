#!/bin/bash -x
echo "Welcome to the Snake and ladder game"
read -p "Enter username: " name
echo $name
winning_pos=100
starting_pos=0
current_pos=starting_pos

#function to rolls the die
function dieroll() {
	dice=$(( RANDOM % 6 + 1 ))
	echo $dice
}

#function to check for options in case of no play, ladder, or snake
function optioncheck() {
	while [[ $current_pos -lt $winning_pos ]]
	do
	options=$(( RANDOM % 3 + 1 ))
	echo $options
	case $options in
		1) current_pos=$current_pos;; #no play
		2) current_pos=$(( $current_pos + $(dieroll) ))
			if [ $current_pos -gt $winning_pos ]
			then 
				current_pos=$(( $current_pos - $(dieroll) ))
			fi
			;; # ladder
		3) current_pos=$(( $current_pos - $(dieroll) ));; # snake
	esac
	if [ $current_pos -lt 0 ]
	then
		current_pos =0
	fi
	done
	echo $current_pos
}

