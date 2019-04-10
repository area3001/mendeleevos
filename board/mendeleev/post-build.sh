#!/bin/sh

set -u
set -e

# add boot partition mount
grep -q "^/dev/mmcblk0p1" $TARGET_DIR/etc/fstab || echo "/dev/mmcblk0p1	/boot		vfat	defaults,ro	0	0" >> $TARGET_DIR/etc/fstab

# Make boot directory
mkdir -p "${TARGET_DIR}/boot"
