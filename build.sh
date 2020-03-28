#!/bin/bash

#if you want to call this script from outside of the folder that contains it, uncomment below file and change it to the folder that holds the script
#cd /dir/yourpath

if [ -z "$1" ]
  then
    echo "Argument #1 -> jar address" && exit 1
fi

if [ -z "$2" ]
  then
    echo "Argument #2 -> service name" && exit 1
fi

jarAddr=$1
serviceName=$2


sudo chown springboot:springboot $jarAddr
sudo chmod 500  $jarAddr

cp example.service $serviceName.service
sed -i 's/appname/'$serviceName'/g' $serviceName.service
sed -i "s~address~$jarAddr~g" $serviceName.service
mv $serviceName.service /etc/systemd/system
systemctl enable $serviceName

#echo "Dont forget to use 'chattr +i $jarAddr' to lock file from being removed or modified"

echo "DONE!"

