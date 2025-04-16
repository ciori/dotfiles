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
- clone this repo: `git clone https://github.com/ciori/dotfiles.git`
  - cd into the correct rice folder: `cd dotfiles/alpine-labwc-desktop/scripts`
- execute first script: `./init.sh`
- relogin
- execute second script: `./labwc.sh`

## Manual Tests

- Setup LabWC: `doas apk add labwc labwc-doc xwayland foot wofi swaylock swaybg swayidle`
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

- missing graphics driver: https://wiki.alpinelinux.org/wiki/Graphics_driver
- network manager and cli: https://wiki.alpinelinux.org/wiki/Configure_Networking#See_also
- secure root account: https://wiki.alpinelinux.org/wiki/Setting_up_a_new_user#Creating_a_new_user
- set fonts: https://wiki.alpinelinux.org/wiki/Fonts
- printers: https://wiki.alpinelinux.org/wiki/Printer_Setup
- firewall (awall or ufw): https://wiki.alpinelinux.org/wiki/Tutorials_and_Howtos#Firewall_and_VPN
- secure system: apparmor and other stuff
