#!/bin/sh

BOARD_DIR="$(dirname $0)"
BOARDS_DIR="${BOARD_DIR}/.."
GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

# Adjust the cmdline.txt
cp "${BOARD_DIR}/cmdline.txt" "${BINARIES_DIR}/rpi-firmware"

# Adjust the config.txt
cp "${BOARD_DIR}/config.txt" "${BINARIES_DIR}/rpi-firmware"

# Adjust the settings file
cp "${BOARDS_DIR}/mendeleev/settings" "${BINARIES_DIR}/settings"



rm -rf "${GENIMAGE_TMP}"

genimage                           \
	--rootpath "${TARGET_DIR}"     \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

exit $?
