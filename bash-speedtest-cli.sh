#!/bin/sh

while true
do

currentTime=$(date "+%H:%M:%S on %Y-%m-%d")

echo 'Starting a SpeedTest check at' $currentTime

speedtest-cli --json | python -m json.tool

echo 'Finished with the test at' $currentTime

sleep 900

done
