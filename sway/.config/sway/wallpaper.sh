#!/bin/bash
# Professional Wallpaper & Theme Daemon
# Syncs Fedora 44 assets and system color-scheme

PIDFILE="/tmp/sway-wallpaper.pid"

# Kill existing instance if it exists
if [ -f "$PIDFILE" ]; then
    old_pid=$(cat "$PIDFILE")
    kill "$old_pid" 2>/dev/null
fi
echo "$$" > "$PIDFILE"

DAY_WALLPAPER="/home/xguo/dotfiles/assets/f44-day.png"
NIGHT_WALLPAPER="/home/xguo/dotfiles/assets/f44-night.png"

while true; do
    HOUR=$(date +%H)
    if [ "$HOUR" -ge 07 ] && [ "$HOUR" -lt 19 ]; then
        # Day: 7 AM - 7 PM
        WALLPAPER=$DAY_WALLPAPER
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    else
        # Night: 7 PM - 7 AM
        WALLPAPER=$NIGHT_WALLPAPER
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    fi
    
    # Apply to all outputs (Built-in and External)
    swaymsg "output * bg $WALLPAPER fill"
    
    # Wait 5 minutes before checking again
    sleep 300
done
