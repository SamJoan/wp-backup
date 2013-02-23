#!/bin/bash

set -u
set -e

# fetch credentials
. credentials.sh

logFile=log.txt
sess='--check-status --session=wp-bak'

# login
if http $sess -f POST "https://$u.wordpress.com/wp-login.php" log=$u pwd=$p testcookie=1 &>> $logFile; then
	# Status code 200 means wp didn't like the username and password.
	echo Wordpress did not like the given username and password. Please check the credentials.sh file.
	exit 1
else 
	case $? in
		3) echo Logged in successfully, will now download file. ;;
		*) echo Unexpected error! 4xx or 5xx? logs are at $logFile.
			exit 1;;
	esac
fi

# get the file
date=`date +%Y-%m-%d.%H:%M:%S`
file=backups/$u.$date.xml
if http $sess https://$u.wordpress.com/wp-admin/export.php?download=true > $file 2>> $logFile; then
	echo File \'$file\' created.
else 
	case $? in
		*) echo Unexpected error ocurred! Please check $logFile
			exit 1;;
	esac
fi
