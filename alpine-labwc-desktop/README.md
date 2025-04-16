# Alpine LabWC Desktop

Alpine rice with LabWC for a Desktop system.

Links:

- Main site: https://alpinelinux.org/
- Installation guide: https://wiki.alpinelinux.org/wiki/Installation
- Howtos: https://wiki.alpinelinux.org/wiki/Tutorials_and_Howtos

## Features

- Alpine Linux
- Wayland
- LabWC
- ...

## Setup

- Download, verify and boot the latest Alpine Linux iso
  - login as `root` with no password
- Install Alpine Linux with: `setup-alpine`
  - follow installation wizard
    - switch to edge release, use https urls and enable community and testing repos
  - then reboot and login as the non-root user
- Update system:
  ```sh
  doas apk update
  doas apk upgrade
  ```
- Install common utilities: `doas apk add util-linux grep findutils pciutils usbutils udisks2 iproute2 drill`
- Setup man pages: `doas apk add mandoc mandoc-apropos docs`
- Setup eudev: `doas setup-devd udev`
- Setup dbus:
  ```sh
  doas apk add dbus dbus-x11
  doas rc-update add dbus
  doas rc-service dbus start
  ```
- Setup graphics driver: `doas apk add mesa-dri-gallium mesa-va-gallium`
  - install other drivers based on graphics card: https://wiki.alpinelinux.org/wiki/Graphics_driver
- Install common fonts:
  ```sh
  doas apk add font-terminus font-inconsolata font-dejavu font-noto font-noto-cjk font-awesome font-noto-extra
  doas apk add font-vollkorn font-misc-cyrillic font-mutt-misc font-screen-cyrillic font-winitzki-cyrillic font-cronyx-cyrillic
  doas apk add font-noto-thai font-noto-tibetan font-ipa font-sony-misc font-jis-misc
  doas apk add font-isas-misc
  doas apk add font-arabic-misc font-noto-armenian font-noto-cherokee font-noto-devanagari font-noto-ethiopic font-noto-georgian
  doas apk add font-noto-hebrew font-noto-lao font-noto-malayalam font-noto-tamil font-noto-thaana font-noto-thai
  ```
- Setup seat manager:
  ```sh
  doas apk add seatd
  doas rc-update add seatd
  doas service seatd start
  doas adduser $USER seat
  doas addgroup $USER audio
  doas addgroup $USER video
  ```
  - then relogin
- Setup sound: `doas apk add pipewire wireplumber pipewire-pulse pipewire-jack pipewire-alsa pavucontrol`
- Install CPU microcode: `doas apk add amd-ucode` or `doas apk add intel-ucode`
- Setup LabWC:
  ```sh
  doas apk add labwc labwc-doc xwayland foot wofi swaylock swaybg swayidle
  ```
  - then reboot
  - create the `.profile` file in the home dir, with the following content:
    ```sh
    if test -z "${XDG_RUNTIME_DIR}"; then
      export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
      if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
      fi
    fi
    ```
  - create the labwc config folder: `mkdir -p ~/.config/labwc`
  - ...
  - launch labwc with: `dbus-launch --exit-with-session labwc`

## TODOs

- network manager and cli: https://wiki.alpinelinux.org/wiki/Configure_Networking#See_also
- secure root account: https://wiki.alpinelinux.org/wiki/Setting_up_a_new_user#Creating_a_new_user
- set fonts: https://wiki.alpinelinux.org/wiki/Fonts
- printers: https://wiki.alpinelinux.org/wiki/Printer_Setup
- firewall (awall or ufw): https://wiki.alpinelinux.org/wiki/Tutorials_and_Howtos#Firewall_and_VPN
- secure system: apparmor and other stuff
