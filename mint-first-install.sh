sudo add-apt-repository ppa:inkscape.dev/stable
sudo add-apt-repository ppa:mati75/gimp30
sudo add-apt-repository ppa:libreoffice-ppa
sudo add-apt-repository ppa:libreoffice/ppa
sudo add-apt-repository ppa:apandada1/foliate
sudo add-apt-repository ppa:apandada1/blanket
sudo add-apt-repository ppa:apandada1/marker
sudo add-apt-repository ppa:apandada1/xournalpp-stable
sudo add-apt-repository ppa:apandada1/wike

sudo apt update

curl -fsSL https://install.julialang.org | sh -s -- -y

mkdir "${HOME}/.npm-packages"
sudo apt  install npm -y && npm config set prefix "${HOME}/.npm-packages"
npm install -g insect

gsettings set org.cinnamon.desktop.wm.preferences button-layout "close,minimize,maximize:"

git clone https://github.com/foundObjects/zram-swap.git
cd zram-swap/
sudo ./install.sh

sudo apt install foliate octave wike xournalpp marker blanket gimp inkscape python-is-python3 python3-numpy python3-scipy mypaint jupyter-notebook npm cpufetch plank ibus-avro python3-octave-kernel vlc okular texstudio texlive-full stellarium -y
sudo updatedb
