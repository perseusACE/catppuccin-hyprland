
#restore pacman packages
echo "installing pacman packages..."
pacman -S --needed - < pacman_pkgs.txt

#restore aur packages
pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo "yay installed: "
yay --version
echo "installing aur packages..."
yay -S --needed - < aur_pkgs.txt

#setup firewall
echo "setting up firewall..."
systemctl start ufw
systemctl enable ufw

ufw default allow outgoing
ufw default deny incoming

ufw allow 22/tcp

#configure kitty
echo "configuring kitty..."
cp .bashrc ~/

echo "done!"
