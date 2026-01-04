#!/bin/bash

# Set playit.gg agent secret

mkdir -p ./.config/playit_gg

if [ "$PLAYIT" = "true" ] || [ "$PLAYIT" = "" ]; then
    echo "WARN: No PLAYIT environment variable configured, this is normal if this is your first deploy."
else
    echo "Your PLAYIT Secret is: $PLAYIT"
    echo "secret_key: = \"$PLAYIT\"" > -p ./.config/playit_gg/playit.toml
fi

playit start &
echo "WARN: $(cat ./.config/playit_gg/playit.toml), if this is your first deployment make sure to copy the secret_key!"

cd velocity

# Functions

convert_motd() {
    echo "${1//\&/"\\&"}"
}

convert_motd_velocity() {
    declare -A converted_color_codes
    converted_color_codes=(
    ["&0"]="<black>"
    ["&1"]="<dark_blue>"
    ["&2"]="<dark_green>"
    ["&3"]="<dark_aqua>"
    ["&4"]="<dark_red>"
    ["&5"]="<dark_purple>"
    ["&6"]="<gold>"
    ["&7"]="<gray>"
    ["&8"]="<dark_gray>"
    ["&9"]="<blue>"
    ["&a"]="<green>"
    ["&b"]="<aqua>"
    ["&c"]="<red>"
    ["&d"]="<light_purple>"
    ["&e"]="<yellow>"
    ["&f"]="<white>"
    ["&l"]="<bold>"
    ["&m"]="<strikethrough>"
    ["&n"]="<underlinedzaq>"
    ["&o"]="<italic>"
    ["&k"]="<obfuscated>"
    ["&r"]="<reset>"
    )

    new_motd=$1

    for code in "${!converted_color_codes[@]}"; do
        new_motd="${new_motd//$code/${converted_color_codes[$code]}}"
    done

    echo "$new_motd"
}

# Check for valid Config Info & Display Config Info

## Required

if [ "$SERVER" = "true" ] || [ "$SERVER" = "" ]; then
    echo "ERROR: Please configure your SERVER environment variable."
    exit 1
else
    echo "Your IP: $SERVER"
fi

## Optional

if [ "$MOTD" = "true" ] || [ "$MOTD" = "" ]; then
    echo "WARN: No MOTD environment variable configured, setting to default."
    MOTD="         &bThis server is hosted by &4&l&nv-jXe!&r\n               &e&l&ntinyurl.com/vv-jXe"
else
    echo "Your MOTD: $MOTD"
fi

if [ "$MAXPLAYERS" = "true" ] || [ "$MAXPLAYERS" = "" ]; then
    echo "WARN: No MAXPLAYERS environment variable configured, setting to default (100)."
    MAXPLAYERS=100
else
    echo "Your Max Players: $MAXPLAYERS"
fi

if [ "$RENDER" = "true" ] || [ "$RENDER" = "" ]; then
    echo "WARN: No RENDER environment variable configured, this web service will NOT be 24/7."
else
    echo "Your Render IP: $RENDER"

    # 24/7
    while true; do sleep 120; curl $RENDER ; done &
fi

if [ "$IMAGE" = "true" ] || [ "$IMAGE" = "" ]; then
    echo "WARN: No IMAGE environment variable configured, leaving blank."

    # Rename server-icon-default.png to server-icon.png
    mv server-icon-default.png server-icon.png
else
    echo "Your \"server-icon.png\" will be pulled from: $IMAGE"

    # Set up server-icon.png
    wget -O server-icon.png $IMAGE
fi

if [ "$SECRET" = "true" ] || [ "$SECRET" = "" ]; then
    echo "WARN: No SECRET environment variable configured, generating a random one."
    SECRET=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1 )
    echo "Your Secret is: $SECRET"
else
    echo "Your Secret is: $SECRET"
fi

echo f"WARN: $(cat .config/playit_gg/playit.toml)"

# Set config

sed -i 's|${SECRET}|'"$SECRET"'|g' forwarding.secret
sed -i 's|${MOTD}|'"$(convert_motd_velocity "$MOTD")"'|g' velocity.toml
sed -i 's|${MAXPLAYERS}|'"$MAXPLAYERS"'|g' velocity.toml
sed -i 's|${SERVER}|'"$SERVER"'|g' velocity.toml

cd plugins/eaglerxserver
sed -i 's|${MOTD}|'"$(convert_motd "$MOTD")"'|g' listeners.toml
cd ../..

# Start Velocity & playit agent
java -Xms512M -Xmx512M -jar velocity.jar