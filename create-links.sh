#!/usr/bin/env bash

FILE=$0
FILE=${FILE%/}
file_basename="${FILE##*/}"
DC="${FILE%$file_basename}"
if [ $DC ]; then
  cd "$DC"
fi

thisScriptDir=$(pwd -P)
cd "-" &>/dev/null

echo "${thisScriptDir}"

function link {
    file=$1

    ln -s ${thisScriptDir}/$file ~/$file
}

ln -s ${thisScriptDir}/git/config ~/.gitconfig

link .bashrc
link .profile
link .vimrc
link .vim
link .gvimrc
link .inputrc
link .ctags
