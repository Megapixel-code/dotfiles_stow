```sh
sudo apt install flatpack xwayland
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak uninstall dev.aunetx.deezer
flatpak remote-delete deezer-linux
flatpak install flathub dev.aunetx.deezer
```

```sh
sudo apt install xwayland libfuse-dev
```
