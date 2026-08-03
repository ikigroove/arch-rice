#!/bin/bash
# my arch linux rice
# rice by binnewbs was used as a base | https://github.com/binnewbs/arch-hyprland

set -e
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}INSTALLING RICE${NC}"
echo -e "${GREEN}========================================${NC}"

if ! grep -q "Arch" /etc/os-release; then
    echo -e "${RED}sorry, this rice is intended only for arch linux. support for other distros will be added later.${NC}"
    exit 1
fi

# installing yay if it not installed
if ! command -v yay &> /dev/null; then
    echo -e "${YELLOW}yay is not found, installing...~${NC}"
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm
    cd -
fi

echo -e "${GREEN}installing packages from pacman...~${NC}"
sudo pacman -S --needed \
    hyprland \
    hypridle \
    hyprlock \
    hyprpicker \
    waybar \
    rofi \
    kitty \
    zsh \
    fastfetch \
    nautilus \
    gnome-text-editor \
    mpv \
    celluloid \
    blueman \
    network-manager-applet \
    xdg-desktop-portal \
    xdg-desktop-portal-gtk \
    qt5ct \
    qt6ct \
    wl-clipboard \
    noto-fonts \
    ttf-font-awesome \
    ttf-jetbrains-mono \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    wireplumber \
    easyeffects \
    fcitx5 \
    fcitx5-configtool \
    fcitx5-gtk \
    fcitx5-qt

echo -e "${GREEN}installing packages from AUR via yay...~${NC}"
yay -S --needed \
    hyprshot \
    uwsm \
    swaync \
    wlogout \
    yazi \
    awww \
    hyprpolkitagent \
    nwg-look \
    cliphist \
    matugen \
    ttf-jetbrains-mono-nerd \
    bibata-cursor-theme \
    whitesur-icon-theme \
    adw-gtk3 \
    cava \
    oh-my-posh-bin 

echo -e "${GREEN}installing xdg-desktop-portal-hyprland...~${NC}"
yay -S --needed xdg-desktop-portal-hyprland

echo -e "${GREEN}creating directories...~${NC}"
mkdir -p ~/.config
mkdir -p ~/Pictures

echo -e "${GREEN}copying configs...${NC}"
# configs list
CONFIG_DIRS=(
    "cava"
    "colors"
    "easyeffects"
    "fastfetch"
    "hypr"
    "kitty"
    "matugen"
    "nwg-look"
    "ohmyposh"
    "rofi"
    "swaync"
    "waybar"
    "wlogout"
    "yazi"
)

for dir in "${CONFIG_DIRS[@]}"; do
    if [ -d "$SCRIPT_DIR/$dir" ]; then
        echo -e "${GREEN}  → copying $dir...~${NC}"
        rm -rf "$HOME/.config/$dir"
        cp -r "$SCRIPT_DIR/$dir" "$HOME/.config/"
    else
        echo -e "${YELLOW}  ⚠ warning: $dir not found in repository, skipping...~${NC}"
    fi
done

if [ -d "$SCRIPT_DIR/wallpapers" ]; then
    echo -e "${GREEN}  → copying wallpapers to ~/Pictures/...~${NC}"
    rm -rf "$HOME/Pictures/wallpapers"
    cp -r "$SCRIPT_DIR/wallpapers" "$HOME/Pictures/"
else
    echo -e "${YELLOW}  ⚠ warning: wallpapers folder not found, skipping...~${NC}"
fi

echo -e "${GREEN}enabling pipewire...~${NC}"
systemctl --user enable --now pipewire pipewire-pulse wireplumber 2>/dev/null || true

echo -e "${GREEN}customixing themes, cursors, and icons...~${NC}"
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice' 2>/dev/null || true
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark' 2>/dev/null || true
gsettings set org.gnome.desktop.interface icon-theme 'Whitesur-dark' 2>/dev/null || true

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}INSTALLATION SUCCESSFUL${NC}"
echo -e "${GREEN}EasyEffects already has several presets for laptops.${NC}"
echo -e "${RED}PLEASE, RESTART YOUR SYSTEM${NC}"
echo -e "${GREEN}========================================${NC}"
echo -e "${YELLOW}Additional notes:~${NC}"
echo "  • To start Hyprland: uwsm start hyprland"
echo "  • Don't forget set up autologin, because this rice use autologin and uwsm instead sddm. As well as setting up Hyprland autostart via uwsm"
echo "  • UWSM tip: launch fcitx5 via uwsm app or systemd user service"
echo "  • Check your EasyEffects presets if you have them"
echo "  • Don't forget to set up your wallpaper with awww"
