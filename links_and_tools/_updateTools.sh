#!/bin/bash

cd "$1"
git checkout master
git reset --hard origin/master
git pull
