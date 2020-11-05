#!/bin/bash

# see man zscroll for documentation of the following parameters
state=$(playerctl --player=spotify status >/dev/null 2>&1)

if [ $? == 1 ]
then
	exit 1
fi

zscroll -l 30 \
        --delay 1 \
        --match-command "playerctl --player=spotify status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "$HOME/.config/polybar/scripts/get_spotify_status.sh" &

wait
