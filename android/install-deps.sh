#!/bin/bash
CWD=$(pwd)
ME=$(id -u)
read -p 'Do you want to install dropbox and qrencode Y/N : ' drop

if [ "$drop" = "n" ]; then
   echo good day $ACCT
   exit
fi 
  
if [ "$drop" = "N" ]; then
   echo good day $ACCT
   exit
fi

if [ -z "$ARCH" ]; then
  case "$( uname -m )" in
    i?86) ARCH=i586 ;;
    arm*) ARCH=arm ;;
       *) ARCH=$( uname -m ) ;;
  esac
fi

 
if [ "$ARCH" = "i586" ]; then
   SYARCH=""
   UARCH="i386"
   XARCH="x86"
elif [ "$ARCH" = "i686" ]; then
   SYARCH=""
   UARCH="i386"
   XARCH="x86"
elif [ "$ARCH" = "x86_64" ]; then
   SYARCH="64"
   UARCH="amd64"
   XARCH="x86_64"
else
XARCH=android
 fi
SLKGCC="$(gcc --version | grep gcc)"

if [ "$SLKGCC" = "gcc (GCC) 4.7.1" ]; then
  SLKUSYS="14.0"
elif [ "$SLKGCC" = "gcc (GCC) 4.8.2" ]; then
  SLKUSED="14.1"
elif [ "$SLKGCC" = "gcc (GCC) 5.5.0" ]; then
  SLKUSYS="14.2"
else
  SLKUSYS="current"
fi
read -p 'type lower cas kubuntu ubuntu  slackpkg : ' ostype
if [ "$ostype" = "slackpkg" ]; then
   slackpkg=slackware$SYARCH-$SLKUSYS
   mkdir $CWD/$slackpkg
   cd $slackpkg
   wget -c http://flatsfixedbicycles.com/YTTS/deps/slackware$SYARCH-$SLKUSYS/dropbox-66.4.84-$ARCH-1_SBo.tgz
   wget -c http://flatsfixedbicycles.com/YTTS/deps/slackware$SYARCH-$SLKUSYS/qrencode-4.0.2-$ARCH-1_SBo.tgz
if [ "$ME" = "0" ]; then
	upgradepkg --reinstall --install-new *.t?z
else
   su  -c  "upgradepkg --reinstall --install-new *.t?z"	
fi

elif  [ "$ostype" = "kubuntu" ]; then
    sudo apt-get update
    sudo apt install qrencode
    mkdir $CWD/ $ostype-$arch
    cd $ostype-$arch
    wget -O - "https://www.dropbox.com/download?plat=lnx.$XARCH" | tar xzf -
    .dropbox-dist/dropboxd
elif  [ "$ostype" = "ubuntu" ]; then   
    sudo apt-get update
    sudo apt install qrencode 
    sudo apt-get install nautilus-dropbox
elif[ "$ostype" = "android" ]; then
    apt-get update
    apt-get install libqrencode
    apt-get install git
else
echo you need to manualy install qrencode  dropbox  
fi
