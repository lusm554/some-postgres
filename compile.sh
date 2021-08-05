#!/bin/bash

db=learn
if [ ! -z "$2" ]
then
  db=$2
fi

psql postgresql://postgres:lusm123@localhost/$db \
  -c '\timing' \
  -c '\pset null [null]' \
  -f $1

: '
# Compile without time excution 
psql postgresql://postgres:lusm123@localhost/$db -f $1
'

# More about url connection 
# https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING
