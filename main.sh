#!/bin/bash
cd velocity

# Check for valid Config Info

# Required

if [ "$MAXPLAYERS" = "true" ] || [ "$MAXPLAYERS" = "" ]; then
    echo "Please configure your MAXPLAYERS environment variable."
    exit 1
fi

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

if [ "$PLAY_SECRET" = "true" ] || [ "$PLAY_SECRET" = "" ]; then
    echo "No PLAY_SECRET environment variable configured, this is normal if this is the first time you start the service."
    PLAY_SECRET=""
fi

# Display Config Info

echo $PLAY_SECRET

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
sed -i 's/${PLAY_SECRET}/'"$PLAY_SECRET"'/g' config.toml

cd ../..

# Set up server-icon.png

mkdir images && cd images
wget $IMAGE

for file in *
do
    mv $file "../server-icon.png"
done

cd ..

rmdir images

# Set up 24/7 web service

while true; do sleep 120; curl $RENDER ; done &

# Start Velocity

echo "Starting Velocity | For Render"
java -Xmx512M -Xms512M -jar velocity.jar