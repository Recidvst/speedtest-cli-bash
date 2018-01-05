#!/bin/sh

while true
do
	
currentTime=$(date "+%H:%M:%S on %Y-%m-%d")
waitTime='600'
resultsFile='speedtestresults.txt'
BASEDIR=$(dirname "$0")

cd $BASEDIR


echo 'Starting a SpeedTest check at' $currentTime

results=$(speedtest-cli --json)

echo 'Finished with the test'


echo 'Printing to file..'

echo $results | python -m json.tool >> $resultsFile

echo 'File printed'


echo 'Waiting ' $(( $waitTime / 60 )) ' mins..'

sleep $waitTime


done