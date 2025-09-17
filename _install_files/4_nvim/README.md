# nvim

## prerequisites :

```sh
sudo apt install gcc ninja-build gettext cmake curl build-essential git
```

## Install from source (V.0.11.4)

1. Install [build prerequisites](#prerequisites) on your system
2. `cd neovim`
3. `make CMAKE_BUILD_TYPE=RelWithDebInfo`
    - If you want to install to a custom location, set `CMAKE_INSTALL_PREFIX`. See also [INSTALL.md](./INSTALL.md#install-from-source).
    - On BSD, use `gmake` instead of `make`.
4. `sudo make install`
    - Default install location is `/usr/local`
    - On Debian/Ubuntu, instead of `sudo make install`, you can try `cd build && cpack -G DEB && sudo dpkg -i nvim-linux-<arch>.deb` (with `<arch>` either `x86_64` or `arm64`, run `uname-m`) to build DEB-package and install it. This helps ensure clean removal of installed files.

# nvim kickstart

```sh
sudo apt install make unzip gcc ripgrep fd-find xclip fonts-font-awesome
```
