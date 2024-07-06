# Juliup needs to be run without root
curl -fsSL https://install.julialang.org | sh -s -- -y

# Joplin needs to be configured manually without root
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash