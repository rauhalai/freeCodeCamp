#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

DISPLAY_ELEMENT() {  
  #echo fart: $1
  IFS='|'
  read -a ELEMENT_ARRAY1 <<< $1

  echo "The element with atomic number ${ELEMENT_ARRAY1[0]} is ${ELEMENT_ARRAY1[2]} (${ELEMENT_ARRAY1[1]}). It's a ${ELEMENT_ARRAY1[6]}, with a mass of ${ELEMENT_ARRAY1[3]} amu. ${ELEMENT_ARRAY1[2]} has a melting point of ${ELEMENT_ARRAY1[4]} celsius and a boiling point of ${ELEMENT_ARRAY1[5]} celsius."


}

ELEMENT_NOT_FOUND() {
  echo "I could not find that element in the database."
}

# check if there is an argumer
if [[ -z $1 ]] 
  then echo "Please provide an element as an argument." 

  else
    # check if parameter is number
    # if input is not a number
    if [[ ! $1 =~ ^[0-9]+$ ]]
      then 
        # not number, search by symbol or name
        ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
        # check if element exists  
        if [[ -z $ELEMENT ]]
          # not found
          then ELEMENT_NOT_FOUND
          # found
          else DISPLAY_ELEMENT $ELEMENT
        fi
      else
        # search element by number
        ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$1")
        if [[ -z $ELEMENT ]]
          # not found
          then ELEMENT_NOT_FOUND
          # found
          else DISPLAY_ELEMENT $ELEMENT
        fi
    fi
fi

