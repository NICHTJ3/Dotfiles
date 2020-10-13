#!/bin/bash
# Sound
start-pulseaudio-x11 &
pa-applet &
remaps &

# General
sxhkd &
udiskie &
dwm_bar.sh &
nm-applet &
pkill blueman-applet;blueman-applet &
# dwall -s mojave &
bash $HOME/.fehbg &
pkill picom; picom -b &
pkill xss-lock;xss-lock -l -- power-manager lock &
xfce4-power-manager &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
