#!/bin/bash

#res=$(rofi -dmenu -p "menu:" -separator-style none -location 0 -width 250 -hide-scrollbar -padding 30 -font "UbuntuMono Nerd Font 18")
#
#if [ $res = "lock" ]; then
#    /home/khoaduccao/.config/lock.sh
#fi
#if [ $res = "logout" ]; then
#    i3-msg exit
#fi
#if [ $res = "suspend" ]; then
#    systemctl suspend
#fi
#if [ $res = "restart" ]; then
#    systemctl reboot
#fi
#if [ $res = "shutdown" ]; then
#    systemctl poweroff
#fi
#exit 0

poweroff_command="systemctl poweroff"
reboot_command="systemctl reboot"
logout_command="/usr/bin/gnome-session-quit --logout --no-prompt"
lock_command="xdg-screensaver lock"

# you can customise the rofi command all you want ...
rofi_command="rofi"

options=$'  Shutdown\n  Reboot\n  Logout\n  Lockscreen'

# ... because the essential options (-dmenu and -p) are added here
command=$(echo "$options" | $rofi_command -dmenu -p "Powermenu" | cut -d' ' -f3)
if [ $? == 0 ]
then
	case "${command}" in
		"Shutdown") eval $poweroff_command;;
		"Reboot") eval $reboot_command;;
		"Logout") eval $logout_command;;
		"Lockscreen") eval $lock_command;;
	esac
fi
