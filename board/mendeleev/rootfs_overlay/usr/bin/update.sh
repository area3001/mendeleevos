#!/bin/sh
#
# trigger an install of the latest update
#

# Configuration
BUTTON_KEYCODE="LEFT"
HOST=localhost
UPDATES_DIR=/updates

. /etc/mendeleev/update.lib

# get settings from file in boot partition
if [ -e /boot/settings ]; then
  echo "Overriding defaults from /boot/settings"
  . /boot/settings
fi

FW_DIR=${UPDATES_DIR}/arduino
OS_DIR=${UPDATES_DIR}/os

update()
{
  logger -s -t "OTA" -p 5 "starting update..."
  update_os ${OS_DIR}
  update_fw ${FW_DIR} ${HOST}
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
      else # is released
        update
      fi;
      ;;
    SYN_REPORT) # Ignore SYN_REPORT keycodes
      ;;
    esac
  done;
fi