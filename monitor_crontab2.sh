#!/bin/bash

FILE_TO_MONITOR=/etc/crontab
COMPARE_TO_FILE=/home/janne/last.crontab.check
if [ -f $COMPARE_TO_FILE ]
then
		find $FILE_TO_MONITOR -type f -newer $COMPARE_TO_FILE | while read tabfile
		do
		echo "/etc/crontab has been changed" | mail -s "Crontab changed" root
		done
fi
touch $COMPARE_TO_FILE
