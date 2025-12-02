#!/bin/bash
# Simple audio popup script using wpctl (PipeWire)

get_default_sink() {
    wpctl inspect @DEFAULT_AUDIO_SINK@ | grep -m1 node.nick | cut -d '"' -f2
}

get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}'
}

case $1 in
    up)
        wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
        ;;
    down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        ;;
    toggle-mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
    list)
        wpctl status | awk '/Sinks:/,/Sources:/' | grep -E 'Sink|->' | sed 's/│//g'
        ;;
    *)
        echo "$(get_default_sink) $(get_volume)%"
        ;;
esac
