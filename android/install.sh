#!/bin/bash

ME=$(id -u)
if [ "$ME" = "0" ]; then
echo do not run this as root 
exit 
fi

ACCT=$(whoami)

DPBX=Dropbox


 
  

if [ -d $HOME/YTTS/bin ]; then
read -p ' This will overwrite your old installation Y/N : ' decides

if [ "$decides" = "n" ]; then
   echo good day $ACCT
   exit
fi 
  
if[ "$decides" = "N" ]; then
   echo good day $ACCT
   exit
fi
if [ -d $HOME/YTTS/bin ]; then
rm -rf $HOME/YTTS
mkdir -p $HOME/YTTS/bin
cp -rf YTTS-* $HOME/YTTS/bin/
cp -rf customers $HOME/YTTS/
cd  $HOME/YTTS/bin/
sh YTTS-setup
else
mkdir -p $HOME/YTTS/bin
cp -rf YTTS-* $HOME/YTTS/bin/
cp -rf icons  $HOME/YTTS/
cp -rf customers $HOME/YTTS/
cd  $HOME/YTTS/bin/
sh YTTS-setup
fi
