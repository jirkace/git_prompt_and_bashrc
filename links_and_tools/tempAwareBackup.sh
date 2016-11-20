#!/bin/bash

# # script must be root to install
# if [ $UID -ne 0 ] && [ $EUID -ne 0 ]; then
# 	echo -e "\nYou have to be root to run this script. Calling su..."
# 	sudo "$0"
# 	exit 0
# fi



# sudo -u celly "getSmbTemp.sh" 2>/dev/null

STOP_TEMP=39
START_TEMP=31
getTemp="/Users/celly/bin/getSmbTemp.sh"
numfmt="/opt/brew/opt/coreutils/libexec/gnubin/numfmt"

isBackupRunning()
{
	if [ "$(echo -e "$1" | grep "Running = 0")" == "" ] && [ "$(echo -e "$1" | grep "Stopping = 1")" == "" ]; then
		return 1;
	else
		return 0;
	fi
}

showStatus()
{
	osascript -e "display notification \"$1\" with title \"TM backup\""
}

LAST_RUNNING=false

while true; do
	printf "$(date) - "
	if [ "$(mount | grep /Volumes/backup)" == "" ]; then
		printf "Backup not mounted"
	else
		TEMP=$($getTemp)
		if [ "$TEMP" == "" ]; then
			TEMP=100
		fi
		STATUS=$(tmutil status)
		NOT_NOTIFIED=true
		RUNNING=false
		isBackupRunning "$STATUS";
		if [ "$?" == "1" ]; then
			RUNNING=true
		fi
		if $RUNNING; then
			printf "R ${TEMP}°C";
			PERCENT="$(echo -e "$STATUS" | grep "Percent " | egrep -o "[0-9]+\.[0-9]*")"
			DATA_PROGRESS_STAT=""
			DATA_PROGRESS="$(echo -e "$STATUS" | grep bytes | egrep -o "[0-9]+")"
			if [ "$DATA_PROGRESS" != "" ]; then
				DATA_PROGRESS_STAT="${DATA_PROGRESS_STAT}P:$($numfmt --to=iec-i --suffix=B $DATA_PROGRESS) "
			fi
			DATA_TOTAL="$(echo -e "$STATUS" | grep "totalBytes " | egrep -o "[0-9]+")"
			if [ "$DATA_TOTAL" != "" ]; then
				DATA_PROGRESS_STAT="${DATA_PROGRESS_STAT}T:$($numfmt --to=iec-i --suffix=B $DATA_TOTAL) "
			fi
			if [ 1 == $(( $TEMP >= $STOP_TEMP )) ]; then
				tmutil stopbackup
				printf " -> [S]"
				showStatus "stopped after $DATA_PROGRESS_STAT${PERCENT}%"
				LAST_RUNNING=false
				NOT_NOTIFIED=false
			else
				printf " $DATA_PROGRESS_STAT${PERCENT}%%"
			fi
		else
			printf "S ${TEMP}°C"
			printf "start turned off";
			# if [ 1 == $(( $TEMP <= $START_TEMP )) ]; then
			# 	tmutil startbackup
			# 	printf " -> [R]"
			# 	showStatus "started"
			# 	LAST_RUNNING=true
			# 	NOT_NOTIFIED=false
			# fi
		fi
		if $NOT_NOTIFIED; then
			if [ $LAST_RUNNING != $RUNNING ]; then
				if $RUNNING; then
					showStatus "runnning"
				else
					showStatus "not runnning"
				fi
			fi
			LAST_RUNNING=$RUNNING
		fi
	fi
	echo
	sleep 60
done
