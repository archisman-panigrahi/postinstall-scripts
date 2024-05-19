#!/bin/bash

### Do NOT run this script with sudo

sudo apt install git
## Install twofing
cd /tmp
git clone https://github.com/plippo/twofing
sudo apt install -y build-essential libx11-dev libxtst-dev libxi-dev x11proto-randr-dev libxrandr-dev xserver-xorg-input-evdev xserver-xorg-input-evdev-dev
cd twofing
make
sudo make install

## Screen Orientation Manager
cd
git clone https://github.com/archisman-panigrahi/surface-RT-screen-rotator
cd surface-RT-screen-rotator
bash setup.sh
cp $HOME/.local/share/applications/surface-rt-screen-rotator.desktop $HOME/.config/autostart/

## Brightness Script
pip3 install --user rpi-backlight --break-system-packages
echo 'SUBSYSTEM=="backlight",RUN+="/bin/chmod 666 /sys/class/backlight/%k/brightness /sys/class/backlight/%k/bl_power"' | sudo tee -a /etc/udev/rules.d/backlight-permissions.rules
TARGET_DIR="$HOME/.local/share/applications"
TARGET_FILE="$TARGET_DIR/rpi-backlight.desktop"
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

cat > "$TARGET_FILE" <<EOL
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Name=rpi-backlight GUI
Exec=rpi-backlight-gui
Icon=/usr/share/icons/Adwaita/scalable/status/display-brightness-symbolic.svg
Categories=Utility;
EOL

# Make the desktop entry file executable
chmod +x "$TARGET_FILE"

echo "Now Reboot!!"
