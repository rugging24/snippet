#!/bin/bash
set -ue 

declare -a tablespace
tablespace=(`/usr/bin/psql -h localhost -U postgres -p 5433 -c "select oid,spcname,pg_tablespace_location(oid) from pg_tablespace where pg_tablespace_location(oid) <> ''" | xargs -d '|' | xargs -d '-' | xargs -d '+' `)

start=3; # knocking off the header rows
end=`expr "${#tablespace[@]}" - 3`; # knocking off the line that shows the number of returned rows

for ((x=$start; x<=$end ; x++)){
   echo "${tablespace[$x]}" ;
} 
