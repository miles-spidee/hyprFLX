#!/bin/bash

echo "🚀 Installing HyprFLX Dependencies for Arch/Garuda..."
echo

# ---------------------------------------------
# 1. CHECK PACKAGE MANAGER (must be pacman)
# ---------------------------------------------
if ! command -v pacman &> /dev/null
then
    echo "❌ This installer currently supports only Arch/Garuda."
    exit 1
fi

# ---------------------------------------------
# 2. INSTALL SYSTEM PACKAGES
# ---------------------------------------------
echo "📦 Installing core packages..."
sudo pacman -S --needed --noconfirm \
  hyprland \
  waybar \
  rofi-wayland \
  kitty \
  fastfetch \
  dunst \
  swww \
  wlogout \
  brightnessctl \
  playerctl \
  jq \
  wl-clipboard \
  swaylock \
  grim \
  slurp \
  polkit-kde-agent \
  noto-fonts \
  noto-fonts-cjk \
  noto-fonts-emoji \
  ttf-jetbrains-mono \
  bluez-utils \
  gvfs \
  gvfs-mtp \
  gvfs-gphoto2

# ---------------------------------------------
# 3. CHECK FOR YAY (AUR)
# ---------------------------------------------
echo
echo "🔍 Checking for yay..."
if ! command -v yay &> /dev/null
then
    echo "⚠️  'yay' not found. Installing yay..."
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
fi

# ---------------------------------------------
# 4. INSTALL AUR PACKAGES
# ---------------------------------------------
echo
echo "📦 Installing AUR packages..."
yay -S --needed --noconfirm \
  spotify-tui \
  vesktop \
  tty-clock

# ---------------------------------------------
# 5. COPY CONFIG FILES
# ---------------------------------------------
echo
echo "📁 Copying configuration files..."

mkdir -p ~/.config

cp -r .config/* ~/.config/

# ---------------------------------------------
# 6. COPY .zshrc
# ---------------------------------------------
if [ -f ".zshrc" ]; then
  echo "📄 Installing .zshrc..."
  cp .zshrc ~/
fi

# ---------------------------------------------
# 7. WALLPAPERS (if you added extra)
# ---------------------------------------------
if [ -d "wallpapers" ]; then
  echo "🖼 Copying wallpapers..."
  mkdir -p ~/Pictures/HyprFLX
  cp -r wallpapers/* ~/Pictures/HyprFLX/
fi

# ---------------------------------------------
# 8. FINAL STEPS
# ---------------------------------------------
echo
echo "🎉 HyprFLX installation complete!"
echo "➡ Logout and select *Hyprland* from the session menu."
echo "➡ Enjoy your new rice 🤍"
