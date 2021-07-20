# RAW VERSION OF COMPILING SQL FILES
#PGPASSWORD=lusm123
#psql postgres -h 127.0.0.1 -d postgres -f test.sql

# More about url connection 
# https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING

psql postgresql://postgres:lusm123@localhost/learn -f $1
