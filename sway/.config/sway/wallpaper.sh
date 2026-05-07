#!/bin/bash
# Kill other instances of this script
pkill -f $(basename $0) || true

DAY_WALLPAPER="/home/xguo/dotfiles/assets/f44-day.png"
NIGHT_WALLPAPER="/home/xguo/dotfiles/assets/f44-night.png"

while true; do
    HOUR=$(date +%H)
    if [ "$HOUR" -ge 07 ] && [ "$HOUR" -lt 19 ]; then
        WALLPAPER=$DAY_WALLPAPER
    else
        WALLPAPER=$NIGHT_WALLPAPER
    fi
    swaymsg "output * bg $WALLPAPER fill"
    sleep 300
done
