#!/bin/sh
#
# trigger an install of the latest update
#

# Configuration
BUTTON_KEYCODE="LEFT"
HOST=localhost

LATESTURL=https://api.github.com/repos/area3001/ArduinoMendeleev/releases/latest

# get settings from file in boot partition
if [ -e /boot/settings ]; then
  echo "Overriding defaults from /boot/settings"
  . /boot/settings
fi

blinkled() {
  cd /sys/class/leds/$1
  echo timer > trigger
  echo $2 > delay_on
  echo $2 > delay_off
}

# Set LED brightness value
setled() {
  cd /sys/class/leds/$1
  echo none > trigger
  echo $2 > brightness
}

update() {
  echo "starting update..." >> /updates/log
  if curl -L --show-error --fail -o /updates/latest.json ${LATESTURL}; then
    # success
    TAG=`jq -r .tag_name /updates/latest.json`
    echo "starting update to version ${TAG}..." >> /updates/log

    if [ ! -d /updates/${TAG} ]; then
      mkdir -p /updates/${TAG}
      cd /updates/${TAG}
      for ASSETURL in $(jq -r '.assets[].browser_download_url' /updates/latest.json); do
        if curl -sLO --show-error --fail ${ASSETURL}; then
          echo "downloaded ${ASSETURL}..." >> /updates/log
        else
          echo "Failed to download ${ASSETURL}!" >> /updates/log
          blinkled ext_led 100
          continue
        fi
      done
    fi

    cd /updates/${TAG}
    if sha1sum -sc release.bin.sha1; then
      echo "Updating to ${TAG}..." >> /updates/log
      cat /updates/${TAG}/release.bin | mosquitto_pub -h ${HOST} -t mendeleev/255/ota -s
      setled ext_led 0
    else
      echo "Sha1 sum is not correct!" >> /updates/log
      blinkled ext_led 100
    fi
  else
    echo "Failed to get json!" >> /updates/log
    blinkled ext_led 100
  fi
}

# turn update led off
setled ext_led 0

if [ $# -gt 0 ]; then
  update
else
  while read TIME CODE VALUE; do
  case "${CODE}" in
    KEY_${BUTTON_KEYCODE}) # button
      if [ $VALUE == 1 ]; then # is pressed
        blinkled ext_led 500
        echo -en "\n\n" >> /updates/log
      else # is released
        update
      fi;
      ;;
    SYN_REPORT) # Ignore SYN_REPORT keycodes
      ;;
    esac
  done;
fi