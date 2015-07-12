#!/bin/bash
#echo 0 just_a_test - Tell me this works
#echo 3 just_a_test - Tell me this works
result=($(check_postgres.pl -p 5432 -H localhost -u postgres -db funmi --action=backends --showperf=1))
item_name="POSTGRES_BACKENDS"
output=${result[@]}

status=${result[1]}

case "$status" in 
	OK:) echo 0 $item_name - $output
	;;
	WARNING:) echo 1 $item_name - $output
	;;
	CRITICAL:|ERROR:)echo 2 $item_name - $output
	;;
	*) echo 2 $item_name - $output
	;;
esac
