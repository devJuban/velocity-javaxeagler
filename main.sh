#!/bin/bash
cd velocity

# Change these values if you are self hosting
# Set the render variable to "self-host"

MOTD=$MOTD
MAXPLAYERS=$MAXPLAYERS
SERVER=$SERVER
RENDER=$RENDER
IMAGE=$IMAGE
SECRET=$SECRET

# Check for valid Config Info

# Required

# move down to optional (below)

if [ "$MAXPLAYERS" = "true" ] || [ "$MAXPLAYERS" = "" ]; then
    echo "Please configure your MAXPLAYERS environment variable."
    exit 1
fi

# dont move $server down to optional

if [ "$SERVER" = "true" ] || [ "$SERVER" = "" ]; then
    echo "Please configure your SERVER environment variable."
    exit 1
fi

# Optional

if [ "$MOTD" = "true" ] || [ "$MOTD" = "" ]; then
    echo "No MOTD environment variable configured, leaving blank."
fi

if [ "$RENDER" = "true" ] || [ "$RENDER" = "" ]; then
    echo "No RENDER environment variable configured, this web service will NOT be 24/7."
fi

if [ "$IMAGE" = "true" ] || [ "$IMAGE" = "" ]; then
    echo "No IMAGE environment variable configured, leaving blank."
fi

# Display Config Info

echo "Your MOTD (eagler only): $MOTD"
echo "Your Max Players (eagler only): $MAXPLAYERS"
echo "Your IP: $SERVER"
echo "Your Render IP: $RENDER"
echo "Your \"server-icon.png\" will be pulled from: $IMAGE"
echo "Your Secret is: $SECRET"

sed -i 's/${SECRET}/'"$SECRET"'/g' forwarding.secret
sed -i 's/${MOTD}/'"$MOTD"'/g' velocity.toml
sed -i 's/${MAXPLAYERS}/'"$MAXPLAYERS"'/g' velocity.toml
sed -i 's/${SERVER}/'"$SERVER"'/g' velocity.toml

cd plugins/eaglerxserver
sed -i 's/${MOTD}/'"$MOTD"'/g' listeners.toml
cd ../velocit

cd ../..

# Set up server-icon.png

wget -O server-icon.png $IMAGE

# Set up 24/7 web service

#while true; do sleep 120; curl $RENDER ; done &
# 24/7 beta
while true; do sleep 120; curl 0.0.0.0 ; done &
# Start Velocity

echo "Starting Velocity | For Render"
java -Xms512M -Xmx512M-XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15 -jar velocity.jar