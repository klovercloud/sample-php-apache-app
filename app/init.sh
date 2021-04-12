#!/bin/bash

set -e

echo '[INFO] Waiting for mounting persistant volume';
sleep 15s

if [ -d "/home/klovercloud/app" ]
then
	echo '[INFO] Persistant volume mounted'
else
	sleep 10s
	echo '[INFO] Persistant volume mounted'
fi

######
#Adjust this section based on your needs
echo "[INFO] Removing replacable files from /home/klovercloud/app";
######

echo "[INFO] Copying app files to /home/klovercloud/app";
cp -r /home/klovercloud/tmp/app /home/klovercloud
echo "[INFO] App files copied to /home/klovercloud/app";

echo '[INFO] Config Initialization Completed';