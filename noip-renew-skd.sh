#!/bin/bash
USER=
SUDO=sudo
LOGDIR=/var/log/noip-renew/$USER
INSTDIR=/usr/local/bin
INSTEXE=$INSTDIR/noip-renew-$USER.sh
CRONJOB="30 3 * * * $INSTEXE $LOGDIR"
NEWCJOB="30 3 $1 $2 * $INSTEXE $LOGDIR"
crontab -u $USER -l | grep -v '/noip-renew*'  |  crontab -u $USER -
if [[ $3 = "True" ]]; then
    (crontab -u $USER -l; echo "$NEWCJOB") |  crontab -u $USER -
else
    (crontab -u $USER -l; echo "$CRONJOB") |  crontab -u $USER -
fi

exit 0
