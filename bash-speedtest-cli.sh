#!/bin/sh

while true
do
	
currentTime=$(date "+%H:%M:%S on %Y-%m-%d")
BASEDIR=$(dirname "$0")

cd $BASEDIR

echo 'Starting a SpeedTest check at' $currentTime

results=$(speedtest-cli --json)

echo 'Finished with the test at' $currentTime

echo $results | python -m json.tool >> speedtestresults.txt

sleep 600

done
