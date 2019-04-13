#!/bin/bash

ME=$(id -u)
if [ "$ME" = "0" ]; then
echo do not run this as root 
exit 
fi

ACCT=$(whoami)

DPBX=Dropbox


if [ -f $HOME/Documents/YTTS/bin ]; then
read -p ' This will overwrite your old installation Y/N : ' decides

if [ "$decides" = "n" ]; then
   echo good day $ACCT
   exit
fi 
  
if [ "$decides" = "N" ]; then
   echo good day $ACCT
   exit
fi
rm -rf $HOME/Documents/YTTS
mkdir -p $HOME/Documents/YTTS/bin
cp    YTTS-setup    $HOME/Documents/YTTS/bin/
cp -rf customers $HOME/Documents/YTTS/
cp -rf inytts $HOME/Documents/YTTS/
cd  $HOME/Documents/YTTS/bin/
sh YTTS-setup
else
read -p ' This will overwrite your old installation Y/N : ' install
mkdir -p $HOME/Documents/YTTS/bin
cp  YTTS-admin  YTTS-customer-sort  YTTS-payroll  YTTS-rsync  YTTS-setup  YTTS-sort  YTTS-split   $HOME/Documents/YTTS/bin/
cp  customers $HOME/Documents/YTTS/
cd  $HOME/Documents/YTTS/bin/
sh YTTS-setup
fi











