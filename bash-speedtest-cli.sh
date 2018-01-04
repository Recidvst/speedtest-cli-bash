#!/bin/sh

while true
do
	
currentTime=$(date "+%H:%M:%S on %Y-%m-%d")
BASEDIR=$(dirname "$0")
resultsFile='speedtestresults.txt'

cd $BASEDIR


echo 'Starting a SpeedTest check at' $currentTime

results=$(speedtest-cli --json)

echo 'Finished with the test'


echo 'Printing to file..'

echo $results | python -m json.tool >> $resultsFile

echo 'File printed'


echo 'Pushing file to Github repo..'

git add $resultsFile
git commit $resultsFile -m "Speedtest results updated - $currentTime "
git push origin master

echo 'File pushed'


echo 'Waiting 10 mins..'

sleep 600

done
