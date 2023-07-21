!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read USERNAME
PLAYER_INFO=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME'")
if [[ -z $PLAYER_INFO ]]
then
  INSERT_RESULT=$($PSQL "INSERT INTO players(username) VALUES('$USERNAME')")
  if [[ $INSERT_RESULT == "INSERT 0 1" ]]
  then
    PLAYER_INFO=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME'")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  fi
else
    GAME_PLAYED=$($PSQL "SELECT COUNT(*) FROM players INNER JOIN games USING(player_id) WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT MIN(tries) FROM players INNER JOIN games USING(player_id) WHERE  username='$USERNAME'")
    echo "Welcome back, $USERNAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
fi
number_of_guesses=1
secret_number=$(( 1 + $RANDOM % 1000 ))
echo $secret_number
echo "Guess the secret number between 1 and 1000:"
  while read GUESS_NUMBER
  do 
    if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
      echo "That is not an integer, guess again:"
  else
    if (( $GUESS_NUMBER > $secret_number ))
    then
      (( number_of_guesses++ ))
      echo "It's lower than that, guess again:"
    elif (( $GUESS_NUMBER < $secret_number ))
    then
      (( number_of_guesses++ ))
      echo "It's higher than that, guess again:"
    else
      break;
    fi
  fi
  done
  echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
  INSERT=$($PSQL "INSERT INTO games(player_id, tries) VALUES ($PLAYER_INFO, $number_of_guesses)")
