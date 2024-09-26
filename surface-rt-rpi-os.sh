#!/bin/bash

### Do NOT run this script with sudo
### Instead run it with `bash surface-rt-rpi-os.sh`

sudo apt update
sudo apt install git wget -y

# Make the desktop entry file executable
chmod +x "$TARGET_FILE"

## Pi Apps
cd
wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash

## Fastfetch
wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.12.0/fastfetch-linux-armv7l.deb
sudo dpkg -i fastfetch-linux-armv7l.deb
sudo -f install

## Numbat
cd /tmp
wget https://github.com/sharkdp/numbat/releases/download/v1.11.0/numbat_1.11.0_armhf.deb
sudo dpkg -i numbat_1.11.0_armhf.deb -y

## Julia
cd
wget https://julialang-s3.julialang.org/bin/linux/armv7l/1.6/julia-1.6.7-linux-armv7l.tar.gz
tar -xzvf julia-1.6.7-linux-armv7l.tar.gz
rm -rf julia-1.6.7-linux-armv7l.tar.gz
home_dir=$(pwd)
ln -s ${home_dir}/julia-1.6.7/bin/julia ${home_dir}/.local/bin/julia

## Freetube
cd /tmp
wget https://github.com/FreeTubeApp/FreeTube/releases/download/v0.20.0-beta/freetube_0.20.0_armv7l.deb
sudo apt install -y ./freetube_0.20.0_armv7l.deb

## Marker
cd /tmp
wget https://launchpad.net/~apandada1/+archive/ubuntu/marker/+files/marker_2023.05.02-1~202304282146~ubuntu22.04.1_armhf.deb
sudo apt install -y ./marker_2023.05.02-1~202304282146~ubuntu22.04.1_armhf.deb

## Grate Driver
sudo apt install libdrm-dev libtool m4 autoconf bison flex xutils-dev xserver-xorg-dev
git clone https://github.com/grate-driver/xf86-video-opentegra
cd xf86-video-opentegra
./autogen.sh
make -j4
sudo make install

### Screen Rotation Script
cd /tmp
wget https://raw.githubusercontent.com/archisman-panigrahi/surface-RT-screen-rotator/surface-rt/srt-screen-rotation-setup.sh
bash srt-screen-rotation-setup.sh

### Brightness Script
cd /tmp
wget https://raw.githubusercontent.com/archisman-panigrahi/postinstall-scripts/main/srt-brightness.sh
bash srt-brightness-screen-rotation.sh

## General software from the repositories
sudo apt install -y okular --no-install-recommends
sudo apt install -y foliate plocate onboard ibus-avro gparted octave jupyter inkscape gimp xournalpp btop cpufetch
sudo updatedb
sudo apt remove evince -y
sudo apt dist-upgrade -y
sudo apt clean

## Replace bad Bangla fonts
sudo bash fix-bangla-fonts.sh
