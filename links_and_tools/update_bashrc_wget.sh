#!/bin/bash

cd /tmp
rm -rf master
wget https://codeload.github.com/bbcelly/git_prompt_and_bashrc/zip/master
mv master master.zip
unzip master.zip
rm -rf master.zip "$HOME/.bashrc_celly"
mv git_prompt_and_bashrc-master "$HOME/.bashrc_celly"
