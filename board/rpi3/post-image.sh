#!/bin/sh

BOARD_DIR="$(dirname $0)"
GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

# Adjust the cmdline.txt
cp "${BOARD_DIR}/cmdline.txt" "${BINARIES_DIR}/rpi-firmware"

# Adjust the config.txt
cp "${BOARD_DIR}/config.txt" "${BINARIES_DIR}/rpi-firmware"

# compile and copy self-defined overlays
DTC=`ls ${BUILD_DIR}/linux-*/scripts/dtc/dtc | head -n1`
if ! [ -x $DTC ]; then
	DTC=dtc
else
	echo "Using $DTC"
fi

for DTS in ${BOARD_DIR}/*-overlay.dts; do
	DTSNAME=`basename ${DTS%%-overlay.dts}`
	echo "Compile $DTSNAME"
	$DTC -@ -O dtb $DTS -o ${BINARIES_DIR}/rpi-firmware/overlays/${DTSNAME}.dtbo
	echo "dtoverlay=${DTSNAME}" >> ${BINARIES_DIR}/rpi-firmware/config.txt
done

rm -rf "${GENIMAGE_TMP}"

genimage                           \
	--rootpath "${TARGET_DIR}"     \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

exit $?
