#!/bin/bash

VAR=$(cat art.txt)
var="\033[91m$VAR\033"

trap ctrl_c INT
response="(HTTP status: 200) (Date: $(date))\r\n\n\n\n$var\n\n\n\n"

usage () {
	echo -e "Usage: bash $0 [port]"
}

ctrl_c () {
	echo -e "\033[91mShutdown heard...goodbye\033[0m"
	exit
}

if [ $# -ne 1 ]; then
	usage
	exit
else
	echo -e "Server started on port $1\n"
	while true; do
	echo -e $response | nc -l -p $1
	
	done
fi