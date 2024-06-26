#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read NAME

# Check if username exists in the database
USER_EXISTS=$($PSQL "SELECT name FROM history WHERE name='$NAME'")

if [[ -z $USER_EXISTS ]]; then
  # If the user does not exist, insert the user
  INSERT_DATA=$($PSQL "INSERT INTO history(name) VALUES('$NAME')")
  echo "Welcome, $NAME! It looks like this is your first time here."
else
  # # If the user exists
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM history WHERE name='$NAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM history WHERE name='$NAME'")
  echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate a random number between 1 and 1000.
TARGET=$(( RANDOM % 1000 + 1 ))

ATTEMPTS=0
# Prompt user to guess the number.
echo "Guess the secret number between 1 and 1000:"

while true; do
  read GUESS
  ATTEMPTS=$(( ATTEMPTS + 1 ))

  # Check if the guess is a number
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -lt $TARGET ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $TARGET ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $ATTEMPTS tries. The secret number was $TARGET. Nice job!"

    # Update the user's game stats
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE history SET games_played = games_played + 1 WHERE name='$NAME'")

    # Update the best game if this was a better game
    if [[ -z $BEST_GAME || $ATTEMPTS -lt $BEST_GAME ]]; then
      UPDATE_BEST_GAME=$($PSQL "UPDATE history SET best_game=$ATTEMPTS WHERE name='$NAME'")
    fi
    
    break
  fi
done
