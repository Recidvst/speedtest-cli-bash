#!/bin/sh

while true
do

echo 'Starting a SpeedTest check at' `date "+%H:%M:%S on %Y-%m-%d"`

speedtest-cli --json | python -m json.tool

echo 'Finished with the test at' `date "+%H:%M:%S on %Y-%m-%d"`

sleep 900

done
