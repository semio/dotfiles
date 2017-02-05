#!/usr/bin/env bash

DIR=`pwd`

for i in `ls`; do
  cd "$i"
  git pull
  cd $DIR
done
