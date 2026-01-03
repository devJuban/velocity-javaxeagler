#!/bin/bash
cd velocity

# playit agent
playit start &
echo "Please claim the tunnel below, you have 5 seconds before the script continues..."
sleep 5

# Check for valid Config Info & Display Config Info

## Required

if [ "$SERVER" = "true" ] || [ "$SERVER" = "" ]; then
    echo "Please configure your SERVER environment variable."
    exit 1
else
    echo "\nYour IP: $SERVER"
fi

## Optional

if [ "$MOTD" = "true" ] || [ "$MOTD" = "" ]; then
    echo "No MOTD environment variable configured, setting to default."
    MOTD="      \&bThis server is being hosted by \&4\&l\&nv-jXe!\&r\n              \&e\&l\&ntinyurl.com/mvk7f4xh"
else
    echo "Your MOTD: $MOTD"
fi

if [ "$MAXPLAYERS" = "true" ] || [ "$MAXPLAYERS" = "" ]; then
    echo "No MAXPLAYERS environment variable configured, setting to default (100)."
    MAXPLAYERS=100
else
    echo "Your Max Players: $MAXPLAYERS"
fi

if [ "$RENDER" = "true" ] || [ "$RENDER" = "" ]; then
    echo "No RENDER environment variable configured, this web service will NOT be 24/7."
else
    echo "Your Render IP: $RENDER"

    # 24/7
    while true; do sleep 120; curl $RENDER ; done &
fi

if [ "$IMAGE" = "true" ] || [ "$IMAGE" = "" ]; then
    echo "No IMAGE environment variable configured, leaving blank."
else
    echo "Your \"server-icon.png\" will be pulled from: $IMAGE"
fi

if [ "$SECRET" = "true" ] || [ "$SECRET" = "" ]; then
    echo "No SECRET environment variable configured, generating a random one."
    SECRET=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1 )
    echo "Your Secret is: $SECRET"
else
    echo "Your Secret is: $SECRET"
fi

# Set config

sed -i 's|${SECRET}|'"$SECRET"'|g' forwarding.secret
sed -i 's|${MOTD}|'"$MOTD"'|g' velocity.toml
sed -i 's|${MAXPLAYERS}|'"$MAXPLAYERS"'|g' velocity.toml
sed -i 's|${SERVER}|'"$SERVER"'|g' velocity.toml

cd plugins/eaglerxserver
sed -i 's|${MOTD}|'"$MOTD"'|g' listeners.toml
cd ../..

# Set up server-icon.png

wget -O server-icon.png $IMAGE

# Start Velocity

java -Xms512M -Xmx512M -jar velocity.jar