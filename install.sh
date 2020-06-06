#!/bin/sh

dir=`cd $(dirname ${BASH_SOURCE:-$0});pwd`

ln -sf $dir/.zshrc ~/.zshrc
ln -sf $dir/.zshfunc ~/.zshfunc
ln -sf $dir/.ziplugin ~/.ziplugin
touch ~/.zshlocal
