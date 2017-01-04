#!/bin/bash

rm -f /Users/jarvis/.jenkins/workspace/Android/apps/android/flashscore/security.properties
rm -f /Users/jarvis/.jenkins/workspace/Android/apps/android/flashscore/fs_build/release.keystore

ln -s /Volumes/secure_disk/Android/security.properties /Users/jarvis/.jenkins/workspace/Android/apps/android/flashscore/
ln -s /Volumes/secure_disk/Android/release.keystore /Users/jarvis/.jenkins/workspace/Android/apps/android/flashscore/fs_build/
