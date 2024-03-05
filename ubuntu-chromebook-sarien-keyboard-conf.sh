sudo apt install git -y
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install

cd ..
rm -rf keyd

cd /tmp


wget https://raw.githubusercontent.com/archisman-panigrahi/eupnea-utils/main/configs/keyboard-layouts/cros-sarien.conf

mv /tmp/cros-sarien.conf /etc/keyd/default.conf

sudo systemctl enable keyd && sudo systemctl start keyd

