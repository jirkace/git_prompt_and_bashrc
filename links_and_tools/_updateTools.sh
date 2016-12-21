#!/bin/bash

cd "$1"
git co master
git reset --hard origin/master
git pull
