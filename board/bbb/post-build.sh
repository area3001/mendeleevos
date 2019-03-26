#!/bin/bash

set -u
set -e

BOARD_DIR="$(dirname $0)"

# copy a clean uEnv.txt to the output/images directory
cp ${BOARD_DIR}/uEnv.txt $BINARIES_DIR/uEnv.txt

# add boot partition mount
grep -q "^/dev/mmcblk0p1" $TARGET_DIR/etc/fstab || echo "/dev/mmcblk0p1	/boot		vfat	defaults,rw	0	0" >> $TARGET_DIR/etc/fstab
