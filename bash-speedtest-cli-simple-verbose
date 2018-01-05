#!/bin/sh

while true
do
	
currentTime=$(date "+%H:%M:%S on %Y-%m-%d")
waitTime='60'
BASEDIR=$(dirname "$0")

cd $BASEDIR


echo 'Starting a SpeedTest check at' $currentTime

speedtest-cli

echo 'Finished with the test'


echo 'Waiting ' $(( $waitTime / 60 )) ' mins..'

sleep $waitTime


done
