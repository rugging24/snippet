#!/bin/sh

function usage() {
	echo " Usage { $0 metafile}" ;
	echo "\n" ;
	echo " Be sure the metafile is readable and is in the right format. See the readme or the manual for more explanation" ;
	exit 2 ;
}

# if [ $# -ne 1 ] && [ ! -e "$1" ]; then 
	# usage ;
# fi

# reading from the metafile

tablespace=(`psql -h localhost -U postgres -p 5433 -W postgres -c "select oid,spcname,pg_tablespace_location(oid)" from pg_tablespace 
where pg_tablespace_location(oid) <> '' | xargs -d '|' | xargs -d '+' | xargs -d '-' `) ;

start=2;
end="${#tablespace[@]}";
for ((i = start;i <= end - 1 ; i++)) ; do 
	if [ "$i" -gt 2 ] ; then 
		echo "${tablespace[$i]}"
	fi
done

exit 0 ;



