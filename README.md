this config has only been tested on debian testing, some parts might not work on other distribs and you would need to find the dependencies yourself.

# Dependencies :

## all :
```sh
```

### lidm
```sh
sudo apt install git make libpam0g-dev gcc
```
### sway
```sh
sudo apt install sway swaybg waybar wofi brightnessctl pulseaudio network-manager inotify-tools psmisc autotiling
```

bluetooth :
```sh
sudo apt install bluez libdbus-1-dev pkg-config
```

volume control :
```sh
sudo apt install pulseaudio cmake gcc pandoc libncurses-dev libpulse-dev
```

to make pulseaudio work :
```sh
systemctl --user restart pulseaudio.service
```

### my nvim config
```sh
sudo apt install git make curl unzip tar gzip gcc wl-clipboard fzf ripgrep
```
for language server :
```sh
#bash
sudo apt install npm shellcheck
```
### zsh
```sh
sudo apt install zsh zsh-syntax-highlighting
```
### kitty
```sh
sudo apt install kitty
```
### fastfetch
```sh
sudo apt install fastfetch
```
### other
be able to mount ntfs filesystems
```sh
sudo apt install ntfs-3g
```
tree filestructure:
```sh
sudo apt install tree
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
