sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
sudo makepkg -si

### KDE Specific

sudo pacman -S plasma-desktop  plasma-wayland-session sddm
sudo systemctl enable sddm.service

sudo pacman -S okular gwenview partitionmanager kalzium kamoso kdeconnect latte-dock filelight ksysguard kdegraphics-thumbnailers
## KDE Connect filesystem browsing
sudo pacman -S sshfs
sudo pacman -S inkscape foliate blanket wike vlc firefox chromium telegram-desktop octave jupyter-notebook code geogebra globalprotect-openconnect marker kvantum texlive-basic texlive-latexextra texlive-latexrecommended texlive-mathscience texlive-plaingeneric texlive-xetex texstudio pdfarranger libreoffice-fresh libreoffice-extension-texmaths micro remmina hunspell hunspell-en_us fastfetch ttf-junicode noto-fonts-emoji nvtop
sudo pacman -S plocate
sudo updatedb

yay -S openblas-lapack
yay -S gimp-devel fcitx5-openbangla-git joplin-appimage noto-fonts-emoji-apple etcher-bin annotator numbat-bin julia-bin megasync-bin dropbox stellarium-bin parabolic hieroglyphic-bin boop-gtk-bin zoom simplescreenrecorder freetube-bin github-desktop-bin dolphin-plugins dolphin-megasync-bin

## Create a mock neofetch wrapper for fastfetch, because I remember neofetch more
sudo ln -s /usr/bin/fastfetch /usr/bin/neofetch

## Afterwards, add appropriate lines to `/etc/environment` from https://github.com/archisman-panigrahi/dotfiles.git.

sudo pacman -S wget
wget https://raw.githubusercontent.com/archisman-panigrahi/dotfiles/main/arch-etc-environment-kde-wayland
sudo mv arch-etc-environment-kde-wayland /etc/environment
wget https://raw.githubusercontent.com/archisman-panigrahi/dotfiles/main/endeavouros%3C--Ubuntu.bashrc
mv endeavouros\<--Ubuntu.bashrc ~/.bashrc

## Then overwrite `$HOME/.config` and `$HOME/.local`
### Mount drives withouts password https://forum.endeavouros.com/t/password-authentication-when-mounting-drives-in-thunar/17812/3

sudo cat >  /etc/polkit-1/rules.d/10-udisks2.rules <<- "EOF"
// Allow udisks2 to mount devices without authentication
// for users in the "wheel" group.
polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
         action.id == "org.freedesktop.udisks2.filesystem-mount") &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});
EOF

## Replace bad Bangla fonts
#sudo rm -rf /usr/share/fonts/truetype/freefont/
#sudo rm -rf /usr/share/fonts/opentype/freefont/
sudo mv fonts/NotoSans-Regular.otf /usr/share/fonts/opentype/freefont/FreeSans.otf
sudo mv fonts/NotoSans-Regular.ttf /usr/share/fonts/truetype/freefont/FreeSans.ttf
sudo mv fonts/NotoSans-Bold.otf /usr/share/fonts/opentype/freefont/FreeSansBold.otf
sudo mv fonts/NotoSans-Bold.ttf /usr/share/fonts/truetype/freefont/FreeSansBold.ttf
