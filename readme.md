# Dotfiles Setup

This repository contains my personal dotfiles and configuration setup for a customized Arch Linux environment. The setup includes various applications, themes, icons, and fonts to create an aesthetically pleasing and efficient workspace.

## Table of Contents
- [Installation](#installation)
- [Installed Packages](#installed-packages)
- [Fonts](#fonts)
- [Icons](#icons)
- [Themes](#themes)
- [Configuration Files](#configuration-files)
- [Usage](#usage)
- [Environment Overview](#environment-overview)

## Installation

To set up the environment, execute the following commands in your terminal:

```bash
# Install required packages
sudo pacman -Syu
sudo pacman -S base-devel ttf-firacode-nerd jq waybar cmus libmad networkmanager sddm network-manager-applet blueman bluez celluloid bluez-utils
yay -S cava catppuccin-cursors-mocha catppuccin-gtk-theme catppuccin-cursors catppuccin-icons tela-circle-icon-theme

# Enable and start NetworkManager service
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

# Enable and start Bluetooth service
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Enable and start SDDM service
sudo systemctl enable sddm.service
sudo systemctl start sddm.service

# mount parttion
sudo pacman -S ntfs-3g
UUID=342AFB742AFB318A /home/rayhan/mnt/g    ntfs-3g  defaults 0 2

# Install additional applications
sudo pacman -S hyprland hyprlock foot fish rofi fastfetch grim mako nwg-look

# Install JetBrains Mono font
sudo pacman -S ttf-jetbrains-mono ttf-nerd-fonts-symbols papirus-icon-theme
