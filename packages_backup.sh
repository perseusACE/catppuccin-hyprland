echo "Backing up all packages..."
#echo $PWD
#pacman packages backup
pacman -Qqen > pacman_pkgs.txt

#aur packages backup
pacman -Qqem > aur_pkgs.txt

echo "Done..."
