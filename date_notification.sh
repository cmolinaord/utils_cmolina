#!/bin/bash
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
notify-send --icon=/home/cmolina/.icons/clock.png "Son las $(date +"%H:%M")" "uptime: $(uptime |cut -d" " -f5|sed "s/,//")"
