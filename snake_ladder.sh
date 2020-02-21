#!/bin/bash -x
echo "Welcome to the Snake and ladder game"
read -p "Enter username: " name
echo $name
winning_pos=100
starting_pos=0
current_pos=0

#function to rolls the die
function dieroll() {
	dice=$(( RANDOM % 6 + 1 ))
	echo $dice
	(( roll_count++ ))
}

#function to check for options in case of no play, ladder, or snake
function optioncheck(){
	while [[ $current_pos -ne $winning_pos ]]
	do
		options=$(( RANDOM % 3 + 1 ))
		echo $options
		case $options in
			1) current_pos=$current_pos;; #no play the player stays in same position
			2) dieroll
				current_pos=$(( $current_pos + $dice ))
				if [ $current_pos -gt $winning_pos ]
				then
					current_pos=$(( $current_pos - $dice))
				fi
				;; # ladder, player moves ahead by the number of position received in the die
			3) dieroll
				current_pos=$(( $current_pos - $dice ))
				if [ $current_pos -lt 0 ]
				then
					current_pos=0
				fi
				;; # snake, player moves behind by the number of position received in the die
		esac
	echo $current_pos
	done
}
optioncheck
echo $roll_count
