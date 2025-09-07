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
