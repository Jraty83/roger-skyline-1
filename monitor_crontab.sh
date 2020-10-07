#!/bin/bash

FILE_TO_MONITOR="/etc/crontab"
COMPARE_TO_FILE="/home/janne/last.crontab.check"
CHECKSUM=$(sudo md5sum $FILE_TO_MONITOR)
if [ ! -f $COMPARE_TO_FILE ]
then
		echo "$CHECKSUM" > $COMPARE_TO_FILE
		exit 0;
fi;
		echo "$CHECKSUM"
		cat $COMPARE_TO_FILE
if [ "$CHECKSUM" != "$(cat $COMPARE_TO_FILE)" ];
		then
		echo "$CHECKSUM" > "$COMPARE_TO_FILE"
		echo "$FILE_TO_MONITOR has been modified ! '*_*" | mail -s "$FILE_TO_MONITOR modified !" root
fi;
