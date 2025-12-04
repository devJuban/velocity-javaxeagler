#!/bin/bash
cd velocity

# bore

apt install openjdk-21-jre -y

# Check for valid Config Info

# Required

if [f"$MAXPLAYERS" -eq true]; then
    echo "Please configure your MAXPLAYERS environment variable."
    exit 1
fi

if [f"$SERVER" -eq true]; then
    echo "Please configure your SERVER environment variable."
    exit 1
fi

# Optional

if [f"$MOTD" = true]; then
    echo "No MOTD environment variable configured, leaving blank."
fi

if [f"$RENDER" = true]; then
    echo "No RENDER environment variable configured, this web service will NOT be 24/7."
fi

if [f"$IMAGE" = true]; then
    echo "No IMAGE environment variable configured, leaving blank."
fi

# Display Config Info

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
java -Xmx512M -Xms512M -jar velocity.jar &

# Run "bore"
bore local 14457 --to bore.pub 