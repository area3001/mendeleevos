#!/bin/sh

set -u
set -e

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
fi

# add boot partition mount
if [ -e ${TARGET_DIR}/etc/fstab ]; then
    grep -qE '^/dev/mmcblk0p1' ${TARGET_DIR}/etc/fstab || \
      echo '/dev/mmcblk0p1	/boot	vfat	defaults,ro	0	0' >> ${TARGET_DIR}/etc/fstab
    # add configfs mount
    grep -qE '^configfs' ${TARGET_DIR}/etc/fstab || \
        echo 'configfs	/sys/kernel/config	configfs	defaults	0	0' >> ${TARGET_DIR}/etc/fstab
fi
