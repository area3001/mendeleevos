#!/bin/bash

set -u
set -e

BOARD_DIR="$(dirname $0)"

# copy a clean uEnv.txt to the output/images directory
cp ${BOARD_DIR}/uEnv.txt $BINARIES_DIR/uEnv.txt
