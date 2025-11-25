#!/bin/bash

echo "🚀 Installing HyprFLX dependencies..."

# System dependencies
sudo pacman -S --needed \
  hyprland waybar rofi-wayland \
  swww wlogout brightnessctl \
  playerctl bluez-utils \
  network-manager-applet \
  kitty sassc jq wl-clipboard grim slurp \
  pamixer zsh noto-fonts noto-fonts-cjk \
  noto-fonts-emoji ttf-jetbrains-mono

echo "📦 Installing AUR packages (yay required)..."
yay -S --needed spotify-tui vesktop tty-clock

echo "📁 Copying config files..."
cp -r .config/* ~/.config/

echo "🖼 Copying wallpapers..."
mkdir -p ~/Pictures/HyprFLX
cp -r wallpapers/* ~/Pictures/HyprFLX/

echo "✔ Done. Logout and log back into Hyprland!"
