#!/bin/bash -x
echo "Welcome to the Snake and ladder game"

#constant
winning_pos=100
starting_pos=0

#variable
player1_pos=$starting_pos
player2_pos=$starting_pos
flag=1

#function to rolls the die
function dieroll() {
	dice=$(( RANDOM % 6 + 1 ))
	echo $dice
	((roll_count++))
}

#function to check for options in case of no play, ladder, or snake
function optioncheck(){
		options=$(( RANDOM % 3 + 1 ))
		echo $options
		case $options in
			1) if [[ $flag -eq 1 ]]
				then
				player1_pos=$player1_pos
				echo player1 position is $player1_pos
				else
					player2_pos=$player2_pos
					echo player2 position is $player2_pos
				fi;; #no play the player stays in same position
			2) if [[ $flag -eq 1 ]]
				then
				player1_pos=$(( $player1_pos + $dice ))
				if [ $player1_pos -gt $winning_pos ]
				then
					player1_pos=$(( $player1_pos - $dice ))
				fi
				echo player1 position is $player1_pos
				else
					player2_pos=$(( $player2_pos + $dice ))
			if [[ $player2_pos -gt $winning_pos ]]
			then
				player2_pos=$(( $player2_pos - $dice ))
			fi
			echo player2 position is $player2_pos
			fi
			;; # ladder, player moves ahead by the number of position received in the die
			3) if [[ $flag -eq 1 ]]
				then
				player1_pos=$(( $player1_pos - $dice ))
				if [ $player1_pos -lt $starting_pos ]
				then
					player1_pos=$starting_pos
				fi
				echo player1 position is $player1_pos
				else
					player2_pos=$(( $player2_pos - $dice ))
			if [[ $player2_pos -lt $starting_pos ]]
			then
				player2_pos=$starting_pos
				fi
				echo player2 position is $player2_pos
				fi
				;; # snake, player moves behind by the number of position received in the die
		esac
}
optioncheck

function player1()
{
	echo "Player 1's turn"
	dieroll
	optioncheck
}

function player2()
{
	echo "Player 2's turn"
	dieroll
	optioncheck
}

function game()
{
	while [[ $player1_pos -ne $winning_pos && $player2_pos -ne $winning_pos ]]
	do
		if [[ $flag -eq 1 ]]
		then
			player1
			flag=2
		elif [[ $flag -eq 2 ]]
		then
			player2
			flag=1
		fi
	done

}
game

echo $roll_count times dice rolled to get the position 100

#check winner
if [[ $flag -eq 1 ]]
then
	echo player 2 won
else
	echo player 1 won
fi

