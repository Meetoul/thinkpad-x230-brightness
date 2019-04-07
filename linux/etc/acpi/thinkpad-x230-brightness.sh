#!/bin/sh

BRIGHTNESS_DIR=/sys/class/backlight/acpi_video0

test -d $BRIGHTNESS_DIR || exit 0

MIN=0
MAX=$(cat $BRIGHTNESS_DIR/max_brightness)
VAL=$(cat $BRIGHTNESS_DIR/actual_brightness)

if [ "$1" = up ]; then
    VAL=$((VAL+1))
else
    VAL=$((VAL-1))
fi

if [ "$VAL" -lt $MIN -o "$VAL" -gt $MAX ]; then
    exit 0
fi

echo $VAL > $BRIGHTNESS_DIR/brightness
