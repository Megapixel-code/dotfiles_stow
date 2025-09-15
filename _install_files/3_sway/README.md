# pretty simple actualy

## 1 :

if using nvidia card, make sure you have the nouveau drivers running and not the proprietary software installed

## 2 :

sway :

```sh
sudo apt install sway
```

dependencies :
```sh
sudo apt install pulseaudio brightnessctl waybar fonts-font-awesome swaybg
```
to make pulseaudio work right there :

```sh
systemctl --user restart pulseaudio.service
```

# configure your keyboard in sway :

```sh
sway input type:keyboard xkb_layout fr
```

