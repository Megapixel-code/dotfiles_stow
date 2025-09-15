# popularity contest to see last used packages

```sh
sudo apt install popularity-contest
/usr/sbin/popularity-contest > log.txt	# to create a file with all of the packages and their last used time
```

# setup locale

```sh
su -
dpkg-reconfigure locales
```
