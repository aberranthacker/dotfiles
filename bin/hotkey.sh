#!/bin/sh
desk_id=$(xdotool get_desktop)
apps_table=$(wmctrl -lx | awk -v \
    desk_id="$desk_id" '$2==desk_id || $2==-1 {print $0}')
win_id=$(printf '%x' "$(xdotool getactivewindow)")
active_window_class=$(echo "$apps_table" | awk -v \
    id="$win_id" '$0 ~ id {print $3}')

if [ "$active_window_class" = "$2" ];
then
    xdotool getactivewindow windowminimize;
else
    wm_id=$(echo "$apps_table" | awk -v wm_class="$2" \
                                 '$3 == wm_class {print $1; exit;}');
    if [ ! -z "$wm_id" ];
    then
        wmctrl -i -a "$wm_id";
    else
        ("$1"&) ;
    fi
fi
