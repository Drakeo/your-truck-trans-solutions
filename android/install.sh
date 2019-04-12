#!/bin/bash

ME=$(id -u)
if [ "$ME" = "0" ]; then
echo do not run this as root 
exit 
fi

ACCT=$(whoami)

DPBX=Dropbox


if [ -f $HOME/YTTS/bin ]; then
read -p ' This will overwrite your old installation Y/N : ' decides
fi

if [ "$decides" = "n" ]; then
   echo good day $ACCT
   exit
fi 
  
if [ "$decides" = "N" ]; then
   echo good day $ACCT
   exit
fi
rm -rf $HOME/YTTS
mkdir -p $HOME/YTTS/bin
cp  YTTS-admin  YTTS-customer-sort  YTTS-payroll  YTTS-rsync  YTTS-setup  YTTS-sort  YTTS-split  $HOME/YTTS/bin/
cp -rf customers $HOME/YTTS/
cd  $HOME/YTTS/bin/
sh YTTS-setup
else
read -p ' This will overwrite your old installation Y/N : ' install
mkdir -p $HOME/YTTS/bin
cp  YTTS-admin  YTTS-customer-sort  YTTS-payroll  YTTS-rsync  YTTS-setup  YTTS-sort  YTTS-split   $HOME/YTTS/bin/
cp  customers $HOME/YTTS/
cd  $HOME/YTTS/bin/
sh YTTS-setup
fi
