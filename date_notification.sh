#!/bin/bash
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
notify-send --icon=/home/cmolina/.icons/clock.png "Now it's $(date +"%H:%M")" "$(uptime -p)"
