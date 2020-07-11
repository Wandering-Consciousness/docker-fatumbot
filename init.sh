#!/bin/sh

echo Starting DirectLine API
#while [ 1 ]; do cd /directline && node dist/cmdutil.js -d 80 -b http://0.0.0.0:5000/api/messages ; done &
cd /directline
node dist/cmdutil.js -d 5002 -b http://0.0.0.0:5000/api/messages &

echo Starting Fatumbot
#while [ 1 ]; do cd /fatumbot && dotnet VFatumbot.dll ; done
cd /fatumbot
dotnet VFatumbot.dll
