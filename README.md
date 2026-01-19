# INTRODUCTION

this config has only been tested on nixos, some parts might not work on other distros.


# INSTALL

## Step 0
create a backup of your config files.

## Step 1
clone repo with submodules:

```sh
git clone --recurse-submodules https://github.com/Megapixel-code/dotfiles_stow.git
```

## Step 2
/!\ you have to be inside the folder you just cloned /!\

```sh
cd dotfiles_stow
```

## Step 3
use stow to slink thoses files

```sh
stow "file name"
```

# UPDATING THE SUBMODULES

you can update the submodules with the following cmd:
```sh
git submodule update --remote
```

