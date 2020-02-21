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
