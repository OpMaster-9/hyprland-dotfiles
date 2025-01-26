#!/bin/bash

#installer for my Dotfiles and stuff
PACKAGES=("hyprland" "rofi-wayland" "hyprlock" "hyprpaper" "hyprpolkitagent" "kitty" "waybar" "fastfetch" "firefox" "git" "hyprshot" "nautilus" "awesome-terminal-fonts" "ttf-font-awesome" "ttf-jetbrains-mono" "ttf-jetbrains-mono-nerd")

echo "Updating system"
sudo pacman -Syu

echo "Installing packages."
for PACKAGE in "${PACKAGES[@]}"; do
    if pacman -Qi "$PACKAGE" &> /dev/null; then
        echo "$PACKAGE is already installed."
    else
        sudo pacman -S "$PACKAGE" --noconfirm
        echo "$PACKAGE has been installed."
    fi
done

cd ~
FOLDER_NAME=".config"

# Check if the folder exists
if [ -d "$FOLDER_NAME" ]; then
    echo "'$FOLDER_NAME' already exists."
else
    echo "Creating '$FOLDER_NAME'"
    mkdir -p "$FOLDER_NAME"
    echo "Folder '$FOLDER_NAME' has been created."
fi

echo "Installing the dotfiles"
cd ~
git clone https://github.com/OpMaster-9/hyprland-dotfiles
mv hyprland-dotfiles/Wallpaper ~
mv hyprland-dotfiles/fastfetch .config/
mv hyprland-dotfiles/hypr .config/
mv hyprland-dotfiles/kitty .config/
mv hyprland-dotfiles/rofi .config/
mv hyprland-dotfiles/waybar .config/

