#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username:"
read USERNAME

USER_RESULT=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

if [[ -z $USER_RESULT ]] 
  then 
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    GAMES_PLAYED=0
    BEST_GAME=1000
    
  else 
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
echo -e "\nGuess the secret number between 1 and 1000:"

GUESS_COUNT=0
GUESS=1001

while [ $GUESS != $SECRET_NUMBER ]
  do
  read GUESS
  # Check 
  while [[ ! $GUESS =~ ^[0-9]+$ ]]
    do
    echo -e "\nThat is not an integer, guess again:"
    read GUESS
  done  

  if [[ $GUESS -lt $SECRET_NUMBER ]]
    then echo "It's higher than that, guess again:"
  fi
  if [[ $GUESS -gt $SECRET_NUMBER ]]
    then echo "It's lower than that, guess again:"
  fi
  # increment guess count
  GUESS_COUNT=$((GUESS_COUNT+1)) 
  
done

echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

# increment games played
GAMES_PLAYED=$(($GAMES_PLAYED+1))
ADD_GAME=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")

# update best game, if game was best
if [[ $GUESS_COUNT -lt $BEST_GAME ]]
  then 
    UPDATE_BEST=$($PSQL "UPDATE users SET best_game=$GUESS_COUNT WHERE username='$USERNAME'")
fi