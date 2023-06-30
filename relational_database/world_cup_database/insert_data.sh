#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "TRUNCATE teams, games")"

cat "games.csv" | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR != "year" ]]
    then
      WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
      if [[ -z $WINNER_ID ]]
      then
        INSERT_DATA="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"
        if [[ $INSERT_DATA == "INSERT 0 1" ]]
        then
          echo "Inserted $WINNER to teams"
          WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
        fi
      fi
      OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
      if [[ -z $OPPONENT_ID ]]
      then
        INSERT_DATA="$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"
        if [[ $INSERT_DATA == "INSERT 0 1" ]]
        then
          echo "Inserted $OPPONENT to teams"
          OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
        fi
      fi
      INSERT_DATA="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
      if [[ $INSERT_DATA == "INSERT 0 1" ]] 
      then
          echo "Inserted $YEAR World Cup $ROUND $WINNER vs $OPPONENT"
      fi 
    fi  

  done