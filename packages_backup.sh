echo "Backing up all packages..."
#echo $PWD
#pacman packages backup
pacman -Qqen > pacman_pkgs.txt

#aur packages backup
pacman -Qqem > aur_pkgs.txt

echo "Done..."
echo "Commiting..."

git add .
git commit -m "updated packages"
git push origin main

echo "Commited and pushed to remote..."
