#!/bin/bash

db=learn
if [ ! -z "$1" ]
then
  db=$1
fi

psql postgresql://postgres:lusm123@localhost:5432/$db
