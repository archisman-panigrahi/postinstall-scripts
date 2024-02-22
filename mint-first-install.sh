sudo add-apt-repository ppa:inkscape.dev/stable -y
sudo add-apt-repository ppa:mati75/gimp30 -y
sudo add-apt-repository ppa:libreoffice/ppa -y
sudo add-apt-repository ppa:apandada1/foliate -y
sudo add-apt-repository ppa:apandada1/blanket -y
sudo add-apt-repository ppa:apandada1/marker -y
sudo add-apt-repository ppa:apandada1/xournalpp-stable -y
sudo add-apt-repository ppa:apandada1/wike -y
sudo add-apt-repository ppa:atareao/telegram -y
sudo add-apt-repository ppa:papirus/papirus -y
sudo add-apt-repository ppa:apandada1/numbat -y

sudo apt install wget gpg -y

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'

sudo apt update

curl -fsSL https://install.julialang.org | sh -s -- -y

#mkdir "${HOME}/.npm-packages"
#sudo apt install npm -y && npm config set prefix "${HOME}/.npm-packages"
#npm install -g insect

gsettings set org.cinnamon.desktop.wm.preferences button-layout "close,minimize,maximize:"

git clone https://github.com/foundObjects/zram-swap.git
cd zram-swap/
sudo ./install.sh

sudo apt install foliate octave wike xournalpp marker blanket gimp inkscape remmina cheese pdfarranger micro python-is-python3 python3-numpy python3-scipy mypaint jupyter-notebook github-desktop cpufetch plank ibus-avro python3-octave-kernel vlc okular texstudio texlive-full code stellarium gparted safeeyes telegram papirus-icon-theme fonts-junicode fonts-noto-color-emoji numbat -y
sudo apt full-upgrade -y

## Remove neofetch and create a mock neofetch wrapper for fastfetch, because I remember neofetch more

#sudo apt remove neofetch -y
#sudo ln -s /usr/bin/fastfetch /usr/bin/neofetch

# Joplin needs to be configured manually without root
# wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

## GoogleDot Red cursors
cd /tmp
wget https://github.com/ful1e5/Google_Cursor/releases/download/v2.0.0/GoogleDot-Red.tar.gz
tar -xvf GoogleDot-Red.tar.gz
sudo mv GoogleDot-* /usr/share/icons/

sudo apt clean
sudo apt autoremove -y
sudo updatedb

