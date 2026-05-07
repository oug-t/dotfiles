#!/bin/bash

PIDFILE="/tmp/sway-wallpaper.pid"

if [ -f "$PIDFILE" ]; then
    old_pid=$(cat "$PIDFILE")
    if [ -n "$old_pid" ] && ps -p "$old_pid" > /dev/null; then
        kill "$old_pid" 2>/dev/null
    fi
fi
echo "$$" > "$PIDFILE"

DAY_WALLPAPER="/home/xguo/dotfiles/assets/f44-day.png"
NIGHT_WALLPAPER="/home/xguo/dotfiles/assets/f44-night.png"

LAST_WALLPAPER=""
LAST_OUTPUTS=0

while true; do
    if ! pgrep -x sway > /dev/null; then
        exit 0
    fi

    HOUR=$(date +%H)
    if [ "$HOUR" -ge 07 ] && [ "$HOUR" -lt 19 ]; then
        WALLPAPER=$DAY_WALLPAPER
        SCHEME='prefer-light'
    else
        WALLPAPER=$NIGHT_WALLPAPER
        SCHEME='prefer-dark'
    fi
    
    CURRENT_OUTPUTS=$(swaymsg -t get_outputs | jq '. | length' 2>/dev/null)
    
    if [ "$WALLPAPER" != "$LAST_WALLPAPER" ] || \
       [ "$CURRENT_OUTPUTS" != "$LAST_OUTPUTS" ] || \
       ! pgrep -x swaybg > /dev/null; then
        
        gsettings set org.gnome.desktop.interface color-scheme "$SCHEME"
        swaymsg "output * bg $WALLPAPER fill"
        
        LAST_WALLPAPER=$WALLPAPER
        LAST_OUTPUTS=$CURRENT_OUTPUTS
    fi
    
    sleep 10
done
