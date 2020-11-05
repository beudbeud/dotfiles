#!/bin/bash -x

rofi_command="rofi"
scrot_name='%Y-%m-%d_$wx$h_scrot.png'
scrot_dest="$HOME/Images/shots/"
scrot_command="$scrot_name -e 'mv $f ~/Images/shots/'"

[ ! -d "$scrot_dest" ] && mkdir -p $scrot_dest

### Options ###
screen=" Fullscreen"
area=" Area"
window=" Windows"
# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1 -p 'Screenshot')"
case $chosen in
    $screen)
        sleep 1; scrot -m $scrot_name -e 'mv $f ~/Images/shots/'
        ;;
    $area)
        scrot -s $scrot_name -e 'mv $f ~/Images/shots/'
        ;;
    $window)
        rofi -show window; scrot -u $scrot_name -e 'mv $f ~/Images/shots/'
        ;;
esac


