#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

#echo -e "\n~~~~~ Welcome to Salo(o)n ~~~~~\n"

MAIN_MENU() {
  # if back with function parameter (text), display it
  if [[ $1 ]]
    then
      echo -e "\n$1"
  fi

  # get and display available services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  #echo -e "\nAvailable services\n"

  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done
  
  # get customers choise of service
  echo -e "\nPlease choose a service"
  read SERVICE_ID_SELECTED

  # if input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then 
      MAIN_MENU "That is not a valid service number"
    else 
      # get service availability 
      
      SERVICE_AVAILABILITY=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
      
      # if not available
      if [[ -z $SERVICE_AVAILABILITY ]]
        then
         MAIN_MENU "That service number is not available"
        else 
         BOOK_APPOINTMENT $SERVICE_ID_SELECTED

      fi  
  fi
}

BOOK_APPOINTMENT() {
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$1")
  #echo -e "\nService chosen: $1"
  echo -e "\nPlease enter your phone number"
  read CUSTOMER_PHONE  

  # get customer id
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get new customer name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
  fi

  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  echo -e "\nHello $CUSTOMER_NAME, which time you would like to have your $SERVICE_NAME?"
  read SERVICE_TIME

  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $1, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

}

MAIN_MENU