#!/bin/bash

while true
do
    while getopts sgc opt;
    do

    case $opt in
        s)
            save=true
        ;;
        g)
            github=true
        ;;
        c)
            csv=true
        ;;
        \?)
            echo "Sorry, didn't understand that option flag.. :| -$OPTARG" >&2
        ;;
    esac

    sleep 1

    done

currentTime=$(date "+%H:%M:%S on %Y-%m-%d")
waitTime='600'
resultsFile='speedtestresults.txt'
BASEDIR=$(dirname "$0")

cd $BASEDIR

echo 'Starting a SpeedTest check at' $currentTime
if [ $csv ] 
then
    results=$(speedtest-cli --csv)
    echo $results
else
    results=$(speedtest-cli --json)
    echo $results | python -m json.tool
fi
echo 'Finished with the test'

if [ $save ] 
then
    echo 'Printing to file..'
    if [ $csv ] 
    then
        echo $results >> $resultsFile
    else
        echo $results | python -m json.tool >> $resultsFile
    fi
    echo 'File printed'
fi

if [ $github ] 
then
    echo 'Pushing file to Github repo..'
        git add $resultsFile
        git commit $resultsFile -m "Speedtest results updated - $currentTime "
        git push origin master
    echo 'File pushed'
fi

echo 'Waiting ' $(( $waitTime / 60 )) ' mins..'

sleep $waitTime

done