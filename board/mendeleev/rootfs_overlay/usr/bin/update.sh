#!/bin/sh
#
# trigger an install of the latest update
#

# Configuration
BUTTON_KEYCODE="LEFT"
DEVICE=ttyAMA0
HOST=localhost
PORT=1883
UPDATEFILE=/tmp/release.bin

# get settings from file in boot partition
if [ -e /boot/settings ]; then
  echo "Overriding defaults from /boot/settings"
  . /boot/settings
fi

# Set LED mode to brightness
setupled() {
  cd /sys/class/leds/$1
  echo brightness > trigger
}

# Set LED brightness value
setled() {
  cd /sys/class/leds/$1
  echo $2 > brightness
}

# turn update led off
setupled ext_led
setled ext_led 0

# Main program flow
while read TIME CODE VALUE; do
case "${CODE}" in
  KEY_${BUTTON_KEYCODE}) # button
    if [ $VALUE == 1 ]; then # is pressed
      echo "button pressed"
      setled ext_led 1
    else # is released
      echo "button released"

      curl -o ${UPDATEFILE} https://github.com/area3001/ArduinoMendeleev/releases/download/latest/release.bin
      # curl -o ${UPDATEFILE}.sha1 https://github.com/area3001/ArduinoMendeleev/releases/download/latest/release.bin.sha1
      cat ${UPDATEFILE} | mosquitto_pub -h ${HOST}:${PORT} -t mendeleev/255/ota -s

      setled ext_led 0
    fi;
    ;;
  SYN_REPORT) # Ignore SYN_REPORT keycodes
    ;;
  esac
done;
