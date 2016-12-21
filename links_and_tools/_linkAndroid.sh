#!/bin/bash

rm -f /var/root/.jenkins/workspace/Android/apps/android/flashscore/security.properties
rm -f /var/root/.jenkins/workspace/Android/apps/android/flashscore/fs_build/release.keystore

ln -s /Volumes/secure_disk/Android/security.properties /var/root/.jenkins/workspace/Android/apps/android/flashscore/
ln -s /Volumes/secure_disk/Android/release.keystore /var/root/.jenkins/workspace/Android/apps/android/flashscore/fs_build/