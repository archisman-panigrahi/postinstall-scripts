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