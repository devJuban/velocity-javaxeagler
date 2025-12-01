#!/bin/bash
cd velocity
 
## Check for valid Config Info

## Required




## Display Config Info

echo "Your MOTD (eagler only): $MOTD"
echo "Your Max Players (eagler only): $MAXPLAYERS"
echo "Your IP: $SERVER"
echo "Your Render IP: $RENDER"
echo "Your \"server-icon.png\" will be pulled from: $IMAGE"

sed -i 's/${MOTD}/'"$MOTD"'/g' velocity.toml
sed -i 's/${MAXPLAYERS}/'"$MAXPLAYERS"'/g' velocity.toml
sed -i 's/${SERVER}/'"$SERVER"'/g' velocity.toml

cd plugins/eaglerxserver

sed -i 's/${MOTD}/'"$MOTD"'/g' listeners.toml

cd ../..

## Set up server-icon.png

mkdir images && cd images
wget $IMAGE

for file in *
do
    mv $file "../server-icon.png"
done

cd ..

rmdir images

## Set up 24/7 web service

while true; do sleep 120; curl $RENDER ; done &

## Install bore 

cargo install bore-cli
bore local 14457 --to bore.pub &

## Start Velocity

echo "Starting Velocity | For Render"
java -Xmx512M -Xms512M -jar velocity.jar