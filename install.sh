#!/bin/bash
#################################################################################
# File Name     : install.sh
# Created By    : Svetlana Linuxenko, <svetlana@linuxenko.pro>, www.linuxenko.pro
# Creation Date : [2018-12-04 18:54]
# Last Modified : [2018-12-04 19:20]
# Description   :  
#################################################################################

SOURCE_FILES="
.oh-my-zsh
.zshrc
.vim
.vimrc
.tmux.conf"

PWD=`pwd`

for i in $SOURCE_FILES
do
  stat ~/$i > /dev/null 2>&1

  if [ $? -ne "0" ]
  then
    echo "${PWD}/$i"
    ln -s "${PWD}/$i" ~/$i
  fi
done
