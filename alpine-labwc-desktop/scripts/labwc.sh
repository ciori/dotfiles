#!/bin/sh

# install labwc
doas apk add labwc labwc-doc xwayland foot wofi swaylock swaybg swayidle

# install applications
doas apk add librewolf mako waybar pcmanfm vim

# create home directories
mkdir ~/pictures
mkdir ~/downloads

# copy dotfiles
cp -R ../configs/.profile ~/.profile
cp -R ../configs/.config ~/
