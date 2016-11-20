#!/bin/bash
# transFill.sh
# @maintainer: celly

FILEPREFIX='default.'
KEY='TRANS_WATCH_APP_FEATURE'
INPUT_FILE=trans.csv

while read LINE
do
	LANG=`echo $LINE | awk -F';' '{print $1}'`
	TRANS=`echo $LINE | awk -F';' '{print $2}'`
	FILES=`find . | grep "$FILEPREFIX$LANG.php"`
	for FILE in $FILES
	do
		sed \
		-e "s|_trans\['$KEY'\] = '.*';|_trans\['$KEY'\] = '$TRANS';|g" \
		-i "" $FILE
	done
done < $INPUT_FILE


# $_trans['TRANS_WATCH_APP_FEATURE'] = 'At the moment, the application only displays the push notifications that are sent to your mobile.';
# $_trans['TRANS_WATCH_APPNAME_FOR_YOUR_WATCH'] = '[app_name] for your watch';
# $_trans['TRANS_WATCH_MORE_FEATURES_COMING'] = 'More features coming soon';
# $_trans['TRANS_WATCH_NOTIFICATION_EXAMPLE'] = 'Notification example:';