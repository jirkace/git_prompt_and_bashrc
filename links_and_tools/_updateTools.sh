#!/bin/bash

cd "$(realpath $1)"
git reset --hard
git co origin/master
git pull