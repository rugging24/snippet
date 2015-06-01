#!/bin/sh
tablespace=(`psql -h localhost -U postgres -p 5433 -W postgres -c "select oid,spcname,pg_tablespace_location(oid) from pg_tablespace where pg_tablespace_location(oid) <> ''"`)

start=2;
end="${#tablespace[@]}";
for (( i = start;i <= end - 1 ; i++ )) ; do
        if [ "$i" -gt 2 ] ; then
                echo "${tablespace[$i]}"
        fi
done

exit 0 ;
