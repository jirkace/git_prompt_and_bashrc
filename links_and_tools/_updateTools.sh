#!/bin/bash

cd "$(realpath $1)"
git co master
git reset --hard origin/master
git pull