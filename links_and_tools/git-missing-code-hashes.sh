#!/bin/bash
# @maintainer: celly

# limit=20
# limit=2
limit="-since=2.months"

isAfterBlankRow=true
patches=""
reportedHashes=""
hash=""
IFS=$'\n'
for row in $(git log -$limit --pretty=format:"%h" --name-status --no-merges --reverse | sed -e 's/^$/NEW_LINE/'); do
	if [ "$row" == "NEW_LINE" ]; then
		isAfterBlankRow=true
		continue
	fi
	if $isAfterBlankRow; then
		isAfterBlankRow=false
		hash=$row
		patch=$(git show $hash | git patch-id | cut -d ' ' -f1)
		if [ "$(echo -e $patches | grep $patch)" != "" ]; then
			hash=""
			continue
		fi
		patches="$patches$patch\n"
		continue
	fi

	if [ "$hash" == "" ]; then
		continue
	fi
	if [ "$(echo -e $reportedHashes | grep $hash)" != "" ]; then
		continue
	fi
	if [ "$(echo $row | egrep -v "^D")" == "" ]; then
		continue
	fi

	file=$(echo $row | awk '{print $2}')

	reportHash=false
	if [ -f $file ]; then
		if [ "$(git log --pretty=format:"%h" $file | grep $hash)" == "" ]; then
			echo Change missing on $file
			reportHash=true
		fi
	else
		echo Missing file $file
		reportHash=true
	fi

	if $reportHash; then
		reportedHashes="$reportedHashes$hash\n"
		git log -1 $hash
		echo
	fi
done