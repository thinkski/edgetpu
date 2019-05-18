#!/bin/bash

# Control fan operation. Force the fan on or revert to automatic control.
# Usage: fan <on|auto>

case $1 in
        "on")
                sudo sh -c 'echo "disabled" > /sys/devices/virtual/thermal/thermal_zone0/mode'
                sudo sh -c 'echo 8600 > /sys/devices/platform/gpio_fan/hwmon/hwmon0/fan1_target';;
        "auto")
                sudo sh -c 'echo "enabled" > /sys/devices/virtual/thermal/thermal_zone0/mode';;
        "temp")
                cat /sys/class/thermal/thermal_zone*/temp | awk '{ print ($1 / 1000) "°C" }';;
        *)
                echo "usage: fan <on|auto>";;
esac
