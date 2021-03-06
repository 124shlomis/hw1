#!/bin/bash

# this script check if there is a memory leaking of the given program
# parameter 1 - name of a log file will be create - for user choice
# parameter 2 - name of a program to check
# parameter 3 - input file for the program

valgrind --tool=memcheck ./"$2" < "$3" &> "$1.log"
ret=`grep -c "ERROR SUMMARY: 0 errors" "$1.log"`
if  [ $ret != 0 ] ; then
	echo "Memory test passed"
	exit 0 
elif [ $ret == 0 ]; then
	echo "Memory test failed"
	exit 1
fi