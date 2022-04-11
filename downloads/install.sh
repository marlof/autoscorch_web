#!/bin/bash

str_Protocol="http"
dir_Location="autoscorch.com/downloads"
file_Version="version.txt"


str_LatestVersion=$(curl ${str_Protocol}://${dir_Location}/${file_Version})
file_Latest="${str_Protocol}://${dir_Location}/escorch.${str_LatestVersion}.tar"


echo $file_Latest

SCORCH_TAR=/tmp/scorch.tar.$$
curl -o $SCORCH_TAR $file_Latest


b_Group=${1:""}
while [[ ! -z $b_Group ]] ; do
  read -ers -n1 -p "Do you want to setup for group use? (y/n): "
  if [ ${REPLY^^} == "Y" ] ; then
    read -p "Enter the group name: "
    if grep -w $REPLY /etc/group ; then
      echo "Setting the write group to $REPLY during install..."
      echo ""
      echo "Run the following commands manaully:"
      echo ""
      echo "chgrp $REPLY ."
      echo "chmod 750 ."
      echo "mkdir -m 770 etc"
      echo "mkdir -m 770 plugins"
      echo "tar xf $SCORCH_TAR && rm $SCORCH_TAR"
      echo "echo \"$(whoami):POWER:ALL\" >> etc/users"
      echo "chmod 750  etc/users"
      echo "chmo 750 etc"
      echo "touch -m 660 var/log/dispatch.log"
      echo "export PATH=${PATH}:$(pwd)"
      echo "./obrar  -install"
      echo "./scorch -install"
      echo "Change scorch to be typeset         str_Group=deployr"

      newgrp $REPLY
      b_Group= 
    else
      echo "No group of that name in /etc/group"
      echo ""
      echo "Check for the correct group name and try again, or chose No"
      echo ""
      echo ""
    fi
  else
    echo "No group chosen... Setting up automatically"
    b_Group=
  fi
done

mkdir -m 770 etc
mkdir -m 770 plugins
tar xf $SCORCH_TAR && rm $SCORCH_TAR
export PATH=${PATH}:$(pwd)
./obrar  -install
./scorch -install
mkdir -p etc
if ! grep $(whoami) etc/users 2>/dev/null ; then
  echo "$(whoami):POWER:ALL" >> etc/users
fi