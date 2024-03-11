!/bin/bash

echo "Installing RebornOS and Chaotic keyrings and mirrorlists..."

sudo pacman -U --noconfirm --needed \
	rebornos-keyring-20231128-1-any.pkg.tar.zst \
	rebornos-mirrorlist-20240215-1-any.pkg.tar.zst \
	chaotic-keyring-20230616-1-any.pkg.tar.zst \
	chaotic-mirrorlist-20240130-1-any.pkg.tar.zst \
	endeavouros-keyring-20231222-1-any.pkg.tar.zst \
	endeavouros-mirrorlist-24.2-1-any.pkg.tar.zst

echo "Installation complete."

# Define the configuration to be added
CONFIG_chaotic="[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist\n"

# Check if the configuration already exists in pacman.conf
if ! grep -q "\[chaotic-aur\]" /etc/pacman.conf; then
	# If it doesn't exist, append the configuration to pacman.conf
	echo -e "$CONFIG_chaotic" | sudo tee -a /etc/pacman.conf >/dev/null
	echo "Chaotic-AUR repository has been added to pacman.conf."
else
	echo "Chaotic-AUR repository already exists in pacman.conf."
fi