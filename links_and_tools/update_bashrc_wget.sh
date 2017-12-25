#!/bin/bash

cd "$HOME"
wget https://codeload.github.com/bbcelly/git_prompt_and_bashrc/zip/master
mv master master.zip
unzip master.zip 
mv git_prompt_and_bashrc-master .bashrc_celly
