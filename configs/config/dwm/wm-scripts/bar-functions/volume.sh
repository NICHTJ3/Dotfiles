#!/bin/bash
set -o errexit

# The locale may change the decimal point
LC_ALL=C

max_volume=65537  # Value of 'volume steps' in $(pacmd list-sinks)
max_percent=100
barwidth=20

action="$1"
sink="$2"

function calc {
    echo "scale=5; $@" | bc
}

function int {
    printf '%.0f' "$1"
}


if [ -z "$sink" ]; then
    # Use default sink
    sink="$(pacmd dump | grep '^set-default-sink ' | cut -d ' ' -f 2)"
elif echo "$sink" | grep -q '^[0-9]*$'; then
    # Convert sink's index to name
    sink="$(pacmd dump | grep '^set-sink-volume ' | sed -n "$(calc $sink+1)"p | cut -d ' ' -f 2)"
    if [ -z "$sink" ]; then
        echo "Invalid sink specifier" >&2
        exit 1
    fi
fi

function is_muted {
    pacmd dump | grep -q "^set-sink-mute $sink yes" && true || false
}

function get_volume {
    int $(pacmd dump | grep "^set-sink-volume $sink" | cut -d ' ' -f 3)
}

function get_volume_percent {
    int $(calc "$(get_volume) / $max_volume * 100")
}

function dwm_volume {
    local percent=$(get_volume_percent)

    if is_muted; then
        speaker='🔇'
    else
        speaker='🔉'
    fi

    printf "%s" "$SEP1"
    printf "VOL %s%%" "$percent"
    printf "%s" "$SEP2"
}


dwm_volume
