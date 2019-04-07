#!/bin/bash

ME=$(id -u)
if [ "$ME" = "0" ]; then
echo do not run this as root 
exit 
fi

ACCT=$(whoami)

DPBX=Dropbox

	echo -e "\e[1;33m Welcome to Your Trucking Trans Solutions.\e[0m"
	echo -e "\e[1;33m One quick question \e[0m"
		echo -e "\e[1;33m Ready to install check for old  installation first ?.\e[0m"
	echo -e "\e[1;33m whom am I loging in to user name ?.\e[0m"
	read varname
    echo -e "\e[1;36m $varname how are you on this $WDATE\e[0m"

if [ "$varname" = "$ACCT" ]; then
    echo -e "\e[1;36m Doing well I hope $ACCT  \e[0m"
    echo -e "\e[1;36m going to need youruser name and password\e[0m"
else 
	echo -e "\e[1;31m Sorry your name does not match the\e[0m"
	echo -e "\e[1;31m computer account login\e[0m"
	echo -e "\e[1;31m you will need to login \e[0m"
	echo -e "\e[1;31myour account try again.\e[0m"
	exit
fi

if su -c true "$USER"; then
  echo -e "\e[1;31m Correct password\e[0m"
else
    echo -e "\e[1;31m sorry User Name or Password does not match\e[0m"
    echo -e "\e[1;31m check your spelling caps on ?\e[0m"
    sleep 5
    exit
fi 

if [ -f $HOME/.local/share/YTTS/bin ]; then
read -p ' This will overwrite your old installation Y/N : ' decides

if [ "$decides" = "n" ]; then
   echo good day $ACCT
   exit
fi 
  
if [ "$decides" = "N" ]; then
   echo good day $ACCT
   exit
fi
rm -rf $HOME/.local/share/YTTS
rm -rf $HOME/.local/share/applications/YTTS-*
mkdir -p $HOME/.local/share/YTTS/bin
cp -rf YTTS-* $HOME/.local/share/YTTS/bin/
mkdir -p $HOME/.local/share/applications
cp -rf desktop/YTTS-* $HOME/.local/share/applications
cp -rf icons  $HOME/.local/share/YTTS/
cp -rf customers $HOME/.local/share/YTTS/
cd  $HOME/.local/share/YTTS/bin/
sh YTTS-setup
else
read -p ' This will overwrite your old installation Y/N : ' install
mkdir -p $HOME/.local/share/YTTS/bin
cp -rf YTTS-* $HOME/.local/share/YTTS/bin/
mkdir -p $HOME/.local/share/applications
cp -rf desktop/YTTS-* $HOME/.local/share/applications
cp -rf icons  $HOME/.local/share/YTTS/
cp -rf customers $HOME/.local/share/YTTS/
cd  $HOME/.local/share/YTTS/bin/
sh YTTS-setup
fi











