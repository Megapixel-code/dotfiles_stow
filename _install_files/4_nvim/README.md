# nvim

## requirements :
```sh
sudo apt install gcc ninja-build gettext cmake curl build-essential git
```
## Install from source

If a package is not provided for your platform, you can build Neovim from source. See [BUILD.md](./BUILD.md) for details.  If you have the [prerequisites](./BUILD.md#build-prerequisites) then building is easy:

    make CMAKE_BUILD_TYPE=Release
    sudo make install

For Unix-like systems this installs Neovim to `/usr/local`, while for Windows to `C:\Program Files`. Note, however, that this can complicate uninstallation. The following example avoids this by isolating an installation under `$HOME/neovim`:

    rm -r build/  # clear the CMake cache
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
    make install
    export PATH="$HOME/neovim/bin:$PATH"

# nvim kickstart

```sh
sudo apt install make unzip gcc ripgrep fd-find xclip fonts-font-awesome
```
