#!/bin/bash

# exit if already installed
readlink ~/.bashrc | fgrep bashrc_dispatch > /dev/null
if [ $? -eq 0 ]; then
	echo "bashrc_dispatch is already installed"
	exit
fi

# http://stackoverflow.com/a/246128
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR


# download bashrc_dispatch
TMPL_FILE=bashrc_dispatch.tmpl
curl https://raw.github.com/josephwecker/bashrc_dispatch/master/bashrc_dispatch > $TMPL_FILE

# check whether the prefix variable still exists.
fgrep 'PRF=' $TMPL_FILE > /dev/null
if [ $? -ne 0 ]; then
	echo "'PRF=' is not found"
	exit
fi

cat $TMPL_FILE| sed "s@PRF=.*@PRF=$DIR/@" > bashrc_dispatch
rm -f $TMPL_FILE

# backup bashrc related files and make symlinks
mkdir bash_backup
mv ~/.bashrc ~/.bash_profile ~/.profile ~/.bash_login bash_backup/
ln -snf $DIR/bashrc_dispatch ~/.bashrc
ln -snf $DIR/bashrc_dispatch ~/.bash_profile
#ln -s $DIR/bashrc_dispatch ~/.profile # uncomment if all the scripts are 'sh' compatible
ln -snf $DIR/bashrc_dispatch ~/.bash_login

cd -
