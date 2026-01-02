#!/bin/bash
cd velocity

# Check for valid Config Info

## Required

if [ "$SERVER" = "true" ] || [ "$SERVER" = "" ]; then
    echo "Please configure your SERVER environment variable."
    exit 1
fi

## Optional

if [ "$MOTD" = "true" ] || [ "$MOTD" = "" ]; then
    echo "No MOTD environment variable configured, setting to default."
    MOTD="§bThis is server is being hosted by velocity-javaxeagler!§n§bYou can also host a server by visiting §e§n§ltinyurl.com/mvk7f4xh§b!"
fi

if [ "$MAXPLAYERS" = "true" ] || [ "$MAXPLAYERS" = "" ]; then
    echo "No MAXPLAYERS environment variable configured, setting to default (100)."
    MAXPLAYERS=100
fi

if [ "$RENDER" = "true" ] || [ "$RENDER" = "" ]; then
    echo "No RENDER environment variable configured, this web service will NOT be 24/7."
fi

if [ "$IMAGE" = "true" ] || [ "$IMAGE" = "" ]; then
    echo "No IMAGE environment variable configured, leaving blank."
fi

if [ "$SECRET" = "true" ] || [ "$SECRET" = "" ]; then
    echo "No SECRET environment variable configured, generating a random one."
    SECRET=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1 )
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
#sed -i 's/${MOTD}/'"$MOTD"'/g' listeners.toml
sed -i 's|${MOTD}|'"$MOTD"'|g' listeners.toml
cd ../..

# Set up server-icon.png

wget -O server-icon.png $IMAGE

# Set up 24/7 web service

#while true; do sleep 120; curl $RENDER ; done &
# 24/7 beta
while true; do sleep 120; curl 0.0.0.0:14457 ; done &
# Start Velocity

echo "Starting Velocity | For Render"
java -Xms512M -Xmx512M -jar velocity.jar