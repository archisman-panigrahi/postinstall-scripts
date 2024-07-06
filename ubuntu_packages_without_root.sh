# Juliup needs to be run without root
curl -fsSL https://install.julialang.org | sh -s -- -y

# Joplin needs to be configured manually without root
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

gsettings set org.cinnamon.desktop.wm.preferences button-layout "close,minimize,maximize:"

sudo bash -c "$(curl -fsSL https://pacstall.dev/q/install)" -y
pacstall -I freetube-deb
pacstall -I zoom-deb

