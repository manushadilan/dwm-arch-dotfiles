#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#keyboard layout
#
#display resolution
xrandr --output Virtual1  --mode 1366x657 &

#compositor
picom -f &

dunst &

nitrogen --restore &
#slstatus
slstatus &

volumeicon &
nm-applet &

#DWM restart loop
while true; do
	#Log stderror to a file
	#dwm 2> ~/.dwm.log
	#No error logging
	dwm > /dev/null 2>&1
done

locker &

#execute DWM
exec dwm

