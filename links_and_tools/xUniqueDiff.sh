#!/bin/bash

set -x
set -o errexit
set -o nounset

PBXPROJ=../FlashScore.xcodeproj/project.pbxproj
DIFF=$(mktemp)
TEMP=$(mktemp)

xUnique.py $PBXPROJ | grep '^\s' | sed 's/^ //' > $DIFF
cat $DIFF
git checkout $PBXPROJ
diff $PBXPROJ $DIFF --new-line-format="" --old-line-format="%L" --unchanged-line-format="" > $TEMP || true
mv $TEMP $PBXPROJ
rm $DIFF
