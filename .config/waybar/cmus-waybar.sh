#!/bin/bash

# Define a function to get the current track info
get_track_info() {
    cmus-remote -Q | grep 'tag title' | cut -d' ' -f3-
}

# Function to toggle play/pause
play_pause() {
    playback_status=$(cmus-remote -Q | grep 'status' | awk '{print $2}')
    if [[ "$playback_status" == "playing" ]]; then
        cmus-remote -u  # Pause if currently playing
    else
        cmus-remote -p  # Play if currently paused
    fi
}

# Check the command-line argument
case "$1" in
    play_pause)
        play_pause
        ;;
    next)
        cmus-remote -n
        ;;
    prev)
        cmus-remote -r
        ;;
    *)
        track_info=$(get_track_info)
        playback_status=$(cmus-remote -Q | grep 'status' | awk '{print $2}')

        if [[ "$playback_status" == "playing" ]]; then
            play_icon="<span color='#89b4fa'></span>"  # Playing icon
        else
            play_icon="<span color='#89b4fa'></span>"  # Pause icon
        fi

        # Output formatted icons
        echo "$play_icon "  # Play/Pause icon
        echo "<span color='#89b4fa'>󰙣</span> "  # Previous icon
        echo "<span color='#89b4fa'>󰙡</span> "  # Next icon
        echo "$track_info"  # Track info
        ;;
esac

