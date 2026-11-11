# dwm-arch-dotfiles

A personal Arch Linux dotfiles setup built around the suckless window manager stack. This repository contains my configuration for a lightweight, keyboard-centric desktop using dwm, dmenu, st, and slstatus, along with supporting X11 and login-manager setup files.

## Overview

This setup is designed for an Arch Linux environment with Xorg and a minimal, productivity-focused workflow. It includes:

- dwm configuration and custom patches
- dmenu launcher setup
- st terminal configuration
- slstatus bar configuration
- LightDM login manager configuration
- shell startup files for Bash
- custom local utility scripts for locking and power actions

## Included components

- `.bashrc` and `.bash_profile` for shell customization
- `.xinitrc` for starting the graphical environment
- `DOTlocal/bin/` for custom helper scripts:
  - `lock`
  - `locker`
  - `powermenu`
- `dwm/` for dwm source, config, and patches
- `dmenu/` for launcher configuration and patches
- `st/` for terminal configuration and patches
- `slstatus/` for the status bar config and components
- `lightdm/` for display manager configuration

## Project structure

```text
.
├── .bash_profile
├── .bashrc
├── .xinitrc
├── DOTlocal/
│   └── bin/
│       ├── banner.png
│       ├── lock
│       ├── locker
│       └── powermenu
├── dwm/
│   ├── config.h
│   ├── dwm.c
│   ├── Makefile
│   └── patches / diff files
├── dmenu/
│   ├── config.h
│   ├── dmenu.c
│   ├── Makefile
│   └── patch files
├── st/
│   ├── config.h
│   ├── st.c
│   ├── Makefile
│   └── patch files
├── slstatus/
│   ├── config.h
│   ├── slstatus.c
│   ├── Makefile
│   └── components/
├── lightdm/
│   ├── lightdm.conf
│   ├── slick-greeter.conf
│   └── xsessions/
└── README.md
```

## Requirements

This configuration assumes an Arch-based system with the following tools installed:

- Xorg / X11
- xorg-xinit
- dunst
- picom
- nitrogen
- volumeicon
- NetworkManager applet
- lightdm
- base-devel
- required libraries for building suckless tools

You may also need the build dependencies required by dwm, dmenu, st, and slstatus, such as:

- libX11
- libXft
- libXinerama
- freetype2
- fontconfig

## Installation

1. Clone the repository:

```bash
git clone https://github.com/manushadilan/dwm-arch-dotfiles.git
cd dwm-arch-dotfiles
```

2. Copy or symlink the dotfiles to your home directory:

```bash
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile
cp .xinitrc ~/.xinitrc
```

3. Build and install the suckless tools:

```bash
cd dwm && make && sudo make install
cd ../dmenu && make && sudo make install
cd ../st && make && sudo make install
cd ../slstatus && make && sudo make install
```

4. Optionally install the LightDM configuration files:

```bash
sudo cp -r lightdm /etc/lightdm/
```

5. Start the session with Xorg:

```bash
startx
```

## Customization

This repo is intentionally modular and easy to tweak:

- Edit `dwm/config.h` for window manager behavior and keybinds
- Edit `dmenu/config.h` for the app launcher appearance and behavior
- Edit `st/config.h` for terminal styling
- Edit `slstatus/config.h` for status bar modules and output
- Update `DOTlocal/bin/` scripts for custom lock/power workflows

## Notes

- This is a personal configuration and may not be plug-and-play for every machine.
- Some tools are patched versions of upstream suckless software, which is why patch files are included.
- The setup is tuned for a minimal desktop and practical daily use on Arch Linux.

## License

This project is distributed for personal use and is not intended to be a general-purpose public package. Please respect the licensing terms of the individual suckless components included in the repository.

## Credits

This setup builds on the suckless tools ecosystem and incorporates common community patches for improved usability and appearance.

If you want, I can also rewrite this into a more polished “GitHub-style” README with screenshots, a quick-start section, and installation commands tailored to your exact setup.
