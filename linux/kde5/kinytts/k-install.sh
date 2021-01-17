#!/bin/bash
CWD=$(pwd)
ME=$(id -u)
if [ "$ME" = "0" ]; then
echo do not run this as root 
exit 
fi

ACCT=$(whoami)

DPBX=Dropbox


if su -c true "$USER"; then
	kdialog  --title "YTTS-service" "YTTS-install" --icon "face-smile-big" --msgbox "<h1>This will overwrite your old installation</h1>" 
else
	kdialog --error "<h1>ERROR Incorrect password Check if caps are on</h1>";
    exit
fi
	kdialog --yesno "Install Your Truck Trans Solutions ? ";

if [ "$?" = 0 ]; then
	kdialog --msgbox "OK installing  $ACCT";
	decides="Y";
elif [ "$?" = 1 ]; 	then
	kdialog --sorry "OK all done $ACCT";
	decides="N";
else
	kdialog --error "ERROR";
	exit ;
fi 

 
if [ "$decides" = "N" ]; then
   echo good day $ACCT
   exit
fi
if [ -d $HOME/.local/share/YTTS/bin ]; then
rm -rf $HOME/.local/share/applications/YTTS-*
rm -rf $HOME/.local/share/YTTS
mkdir -p $HOME/.local/share/YTTS/bin
cp -rf k-YTTS-setup $HOME/.local/share/YTTS/bin/YTTS-setup
mkdir -p $HOME/.local/share/applications
cp -R ../kinytts  $HOME/.local/share/YTTS/
cp -R desktop  $HOME/.local/share/YTTS/
cp -rf customers $HOME/.local/share/YTTS/
mkdir -p $HOME/.kde/share/icons
ln -s $HOME/.local/share/YTTS/kinytts/icons/K-YTTS.png $HOME/.kde/share/icons/K-YTTS.png
cd  $HOME/.local/share/YTTS/bin/
INSTALL=yes sh YTTS-setup 
else
mkdir -p $HOME/.local/share/YTTS/bin
cp -rf k-YTTS-setup $HOME/.local/share/YTTS/bin/YTTS-setup
mkdir -p $HOME/.local/share/applications
cp -R ../kinytts  $HOME/.local/share/YTTS/
cp -R desktop  $HOME/.local/share/YTTS/
cp -rf customers $HOME/.local/share/YTTS/
mkdir -p $HOME/.kde/share/icons
ln -s $HOME/.local/share/YTTS/kinytts/icons/K-YTTS.png $HOME/.kde/share/icons/K-YTTS.png
cd  $HOME/.local/share/YTTS/bin/
INSTALL=yes sh YTTS-setup 
fi
