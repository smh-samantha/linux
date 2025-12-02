# Dotfiles

A fully symlinked, portable Arch Linux + Hyprland environment.
This repo contains all configuration needed to reproduce my desktop setup on any machine.

## Included
- Hyprland
- Waybar
- Rofi
- Kitty
- Neovim
- Thunar
- Wallpapers
- Scripts (Windows VM, custom launchers, utilities)
- Webapps
- Package lists (pacman + AUR)

---

# 1. Installing on a New Machine

### Step 1 — Clone the repo
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles

### Step 2 — Install system packages
sudo pacman -S --needed - < pacman-packages.txt
yay -S --needed - < aur-packages.txt

### Step 3 — Remove existing configs and create symlinks
rm -rf ~/.config/hypr
rm -rf ~/.config/waybar
rm -rf ~/.config/kitty
rm -rf ~/.config/nvim
rm -rf ~/.config/rofi
rm -rf ~/.config/Thunar

ln -s ~/dotfiles/hypr ~/.config/hypr
ln -s ~/dotfiles/waybar ~/.config/waybar
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/rofi ~/.config/rofi
ln -s ~/dotfiles/thunar ~/.config/Thunar

### Step 4 — Reload Hyprland
hyprctl reload

---

# 2. How to Customise

All configs are edited directly inside the dotfiles repo.
Example:
nano ~/dotfiles/hypr/hyprland.conf

Because everything is symlinked:
- Editing dotfiles updates the live config
- Editing live config updates dotfiles
- Nothing gets out of sync

After making changes:
git add .
git commit -m "Update configs"
git push

---

# 3. Updating Package Lists

Refresh package lists whenever you install/remove packages:
pacman -Qq > pacman-packages.txt
yay -Qq > aur-packages.txt

---

# 4. Wallpapers

Wallpapers live in:
~/dotfiles/wallpapers

hyprpaper.conf points to this directory so wallpapers sync automatically.

---

# 5. Scripts & Webapps

Scripts stored in:
~/dotfiles/scripts

Webapps (.desktop launchers) stored in:
~/dotfiles/webapps

Install webapps:
cp webapps/*.desktop ~/.local/share/applications/

Make scripts executable:
chmod +x ~/.local/bin/<script-name>

