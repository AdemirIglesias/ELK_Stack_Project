#!/bin/bash 

if [ $UID != 0 ]
then
echo "This script must be run as root"
exit
fi

# Define packages list
packages=(
    'nano'
    'wget'
    'net-tools'
    'burp'
)

# loop through the list of packages and check to see if they are installed
for package in ${packages[@]};
do
  if [ $(dpkg -l | grep $package | awk -F " " '{print $2}') ]
  then
     echo "$package is installed."
  else
     echo "$package is not installed. Installing now!!"
     apt install -y $package

  fi
done

