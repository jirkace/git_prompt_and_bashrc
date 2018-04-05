#!/bin/bash

rm -f /Users/jarvis/.jenkins/workspace/Android/flashscore/security.properties
rm -f /Users/jarvis/.jenkins/workspace/Android/flashscore/fs_build/release.keystore

ln -s /Volumes/secure_disk/Android/security.properties /Users/jarvis/.jenkins/workspace/Android/flashscore/
ln -s /Volumes/secure_disk/Android/release.keystore /Users/jarvis/.jenkins/workspace/Android/flashscore/fs_build/
