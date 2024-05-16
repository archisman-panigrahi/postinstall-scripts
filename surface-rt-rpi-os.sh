sudo apt update
sudo apt install git

## twofing
cd /tmp
git clone https://github.com/plippo/twofing
sudo apt-get install build-essential libx11-dev libxtst-dev libxi-dev x11proto-randr-dev libxrandr-dev xserver-xorg-input-evdev xserver-xorg-input-evdev-dev
cd twofing
make
sudo make install

#sudo nano /etc/udev/rules.d/70-touchscreen-egalax.rules
#KERNEL=="event*",ATTRS{name}=="FT5406 memory based driver",SYMLINK+="twofingtouch",RUN+="/bin/chmod a+r /dev/twofingtouch"

## Screen Orientation Manager
cd
git clone https://github.com/archisman-panigrahi/surface-RT-screen-rotator
cd surface-RT-screen-rotator
bash setup.sh

## Pi Apps
wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash

## Numbat
cd /tmp
wget https://github.com/sharkdp/numbat/releases/download/v1.11.0/numbat_1.11.0_armhf.deb
sudo dpkg -i numbat_1.11.0_armhf.deb

## General software
sudo apt install okular --no-install-recommends
sudo apt install foliate
