this config has only been tested on debian testing, some parts might not work on other distribs and you would need to find the dependencies yourself.

# Dependencies :

## all :
```sh
sudo apt install git make libpam0g-dev gcc sway swaybg waybar wofi pulseaudio brightnessctl pavucontrol blueman inotify-tools psmisc nm-connection-editor unzip ripgrep fd-find xclip kitty fastfetch
```

### lidm
```sh
sudo apt install git make libpam0g-dev gcc
```
### sway
```sh
sudo apt install sway swaybg waybar wofi pulseaudio brightnessctl pavucontrol nm-connection-editor blueman inotify-tools psmisc
```
to make pulseaudio work :
```sh
systemctl --user restart pulseaudio.service
```
### my nvim config
```sh
sudo apt install make unzip gcc ripgrep fd-find xclip
```
### kitty
```sh
sudo apt install kitty
```
### fastfetch
```sh
sudo apt install fastfetch
```

# Step 0
create a backup of your config files.

# Step 1
clone repo :

```git clone https://github.com/Megapixel-code/dotfiles_stow.git```

# Step 2

/!\ you have to be inside the folder you just cloned /!\
```
cd dotfiles_stow
```

# Step 3

use stow to slink thoses files

for most packages :

```
stow "package file name"
```

for non-home packages :

```
stow -t / "package file name"
```
