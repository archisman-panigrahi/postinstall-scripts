#!/bin/bash

# Install necessary packages
echo "Installing xbindkeys and xbacklight..."
sudo apt-get update
sudo apt-get install -y xbindkeys xbindkeys-config

cp adjust-brightness-rpi $HOME/.local/bin/

# Set up the autostart for xbindkeys
AUTOSTART_FILE=~/.config/lxsession/LXDE-pi/autostart
if ! grep -q "@xbindkeys" "$AUTOSTART_FILE"; then
    echo "@xbindkeys" >> "$AUTOSTART_FILE"
    echo "Added xbindkeys to autostart."
else
    echo "xbindkeys is already in the autostart file."
fi

# Create xbindkeys configuration file
XBINDS_FILE=~/.xbindkeysrc
if [ ! -f "$XBINDS_FILE" ]; then
    xbindkeys --defaults > "$XBINDS_FILE"
    echo "Created default xbindkeys configuration."
fi

# Add key bindings for brightness
{
    echo "# Increase brightness"
    echo "\"adjust-brightness-rpi increase\""
    echo "    XF86MonBrightnessUp"
    echo ""
    echo "# Decrease brightness"
    echo "\"adjust-brightness-rpi decrease\""
    echo "    XF86MonBrightnessDown"
} >> "$XBINDS_FILE"

echo "Added key bindings for brightness control."

# Start xbindkeys
xbindkeys

echo "Setup complete. Please log out and back in to see the changes."
