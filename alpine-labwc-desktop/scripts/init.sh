#!/bin/sh

# update system
doas apk update
doas apk upgrade

# install utilities
doas apk add util-linux grep findutils pciutils usbutils udisks2 iproute2 drill

# install docs
doas apk add mandoc mandoc-apropos docs

# setup eudev
doas setup-devd udev

# setup dbus
doas apk add dbus dbus-x11
doas rc-update add dbus
doas rc-service dbus start

# install cpu microcode
if grep -q 'AuthenticAMD' /proc/cpuinfo; then
    echo "Detected AMD CPU, installing amd-ucode..."
    doas apk add amd-ucode
elif grep -q 'GenuineIntel' /proc/cpuinfo; then
    echo "Detected Intel CPU, installing intel-ucode..."
    doas apk add intel-ucode
else
    echo "Warning: Could not determine CPU vendor for microcode installation."
fi

# setup graphics driver
doas apk add mesa-dri-gallium mesa-va-gallium
# missing graphics driver here
# ...

# setup seatd
doas apk add seatd
doas rc-update add seatd
doas service seatd start
doas adduser $USER seat
doas addgroup $USER audio
doas addgroup $USER video

# setup sound
doas apk add pipewire wireplumber pipewire-pulse pipewire-jack pipewire-alsa pavucontrol

# install fonts
doas apk add font-terminus font-inconsolata font-dejavu font-noto font-noto-cjk font-awesome font-noto-extra
doas apk add font-vollkorn font-misc-cyrillic font-mutt-misc font-screen-cyrillic font-winitzki-cyrillic font-cronyx-cyrillic
doas apk add font-noto-thai font-noto-tibetan font-ipa font-sony-misc font-jis-misc
doas apk add font-isas-misc
doas apk add font-arabic-misc font-noto-armenian font-noto-cherokee font-noto-devanagari font-noto-ethiopic font-noto-georgian
doas apk add font-noto-hebrew font-noto-lao font-noto-malayalam font-noto-tamil font-noto-thaana font-noto-thai
