#!/bin/sh

BOARD_DIR="$(dirname $0)"
BOARDS_DIR="${BOARD_DIR}/.."

# Adjust the settings file
cp "${BOARDS_DIR}/mendeleev/settings" "${BINARIES_DIR}/settings"

GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

rm -rf "${GENIMAGE_TMP}"

genimage \
    --rootpath "${TARGET_DIR}" \
    --tmppath "${GENIMAGE_TMP}" \
    --inputpath "${BINARIES_DIR}" \
    --outputpath "${BINARIES_DIR}" \
    --config "${GENIMAGE_CFG}"
