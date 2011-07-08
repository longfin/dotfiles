#!/bin/sh

cp -RHf ~/.bash_profile .bash_profile
cp -RHf ~/.bashrc .bashrc
cp -RHf ~/.emacs .emacs

mkdir .emacs.d
cp -RHf ~/.emacs.d/* .emacs.d/

