
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
ufw status

#configure kitty
echo "configuring kitty..."
cp .bashrc ~/

#additional startup services
echo "adding power profiles service"
sudo systemctl enable power-profiles-daemon.service
echo "adding timeshift service"
sudo systemctl enable --now cronie

echo "done! rebooting..."
sudo reboot
