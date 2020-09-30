#!/bin/bash

CRONDIR=/var/spool/cron/crontabs
CKFILE=/tmp/last.crontab.check
ALERT=janne@10.11.66.6
if [ -f $CKFILE ]
then
    find $CRONDIR -type f -newer $CKFILE | while read tabfile
    do
       echo "Crontab file for user $(basename $tabfile) has changed" | mail -s "Crontab changed" $ALERT
    done
fi
touch $CKFILE
