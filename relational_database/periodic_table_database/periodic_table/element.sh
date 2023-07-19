PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

ELEMENT=$1
if [[ -z $ELEMENT ]]
then
  echo Please provide an element as an argument.
else 
  if [[ ! $ELEMENT =~ ^[0-9]+$ ]]
 then
  ELEMENT_DETAILS=$($PSQL "SELECT symbol, name, type, atomic_mass, atomic_number, melting_point_celsius, boiling_point_celsius FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE name='$ELEMENT' OR symbol='$ELEMENT'")
  else 
  ELEMENT_DETAILS=$($PSQL "SELECT symbol, name, type, atomic_mass, atomic_number, melting_point_celsius, boiling_point_celsius FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number=$ELEMENT")
  fi
  if [[ ! -z $ELEMENT_DETAILS ]]
  then
    echo "$ELEMENT_DETAILS" | while IFS='|' read SYMBOL NAME TYPE ATOMIC_MASS ATOMIC_NUMBER MELTING_POINT BOILING_POINT
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
    else 
    echo "I could not find that element in the database."
  fi
fi
 