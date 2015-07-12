#!/bin/bash
#echo 0 just_a_test - Tell me this works
#echo 3 just_a_test - Tell me this works
result=$(check_postgres.pl -p 5432 -H localhost -u postgres -db funmi --action=backends --showperf=1)
echo 0 just_a_PG_test - $result
