#!/bin/sh

cp -RHf ~/.bash_profile .bash_profile
cp -RHf ~/.bashrc .bashrc
cp -RHf ~/.emacs .emacs

if [ ! -d .emacs.d ]
then
mkdir .emacs.d
fi
cp -RHf ~/.emacs.d/* .emacs.d/

