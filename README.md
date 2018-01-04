# speedtest-cli-bash
Bash script to run regular speed tests using the SpeedTest CLI tool and store the results both locally and in a GitHub repo.

## Requirements
- The excellent [speedtest-cli](https://github.com/sivel/speedtest-cli "speedtest-cli GitHub page").
- Python with pip (if on Windows you will probably need to install this - download [here](https://www.python.org/downloads 'Python.org Download page'). PIP should be included as part of the Python install.
- Make sure that you have a Python entry in your PATH! Windows requires an environmental variable to be set at `My Computer ‣ Properties ‣ Advanced ‣ Environment Variables`. There's a few Stack Overflow questions about this.

## Instructions
- Install the speedtest cli with PIP by using `pip install speedtest-cli`
- There are two bash file options. The standard will print the results to a text file, while the GitHub version will in addition push to a GitHub repo. Use the method you prefer.
- If you want to push to GitHub then you'll need to set up a repo as I don't really want your speedtest results ;)
- Empty out the speedtestresults.txt file and confirm that this is in the same directory as your bash file.
- Run `bash-speedtest-cli.sh` or `bash-speedtest-cli-github.sh` in your terminal.

## Config
- The time format, wait time between tests and the results filename are all set as variables. The wait time is in seconds.
```
currentTime
waitTime
resultsFile
```
- The speedtest-cli command can be changed to provide results in CSV output etc. by editing this line - `results=$(speedtest-cli --json)`. See the speedtest-cli GitHub Readme for help on the options available.
