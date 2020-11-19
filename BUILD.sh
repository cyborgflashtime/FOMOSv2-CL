#!/bin/bash

ARCH=$1

function main() {
    if [ $ARCH = 'arm' ] || [ $ARCH = 'x86' ]; then
        echo "Building for CPU archetype: $ARCH"
    else
        echo "$ARCH is invalid"
        exit
    fi
    sh install.sh
    cargo build --target $ARCH-FOMOSv2.json
    cargo bootimage
    cd linux/
    make defconfig
    make -j"$(nproc)"
    make isoimage FDINITRD=../arch/$ARCH/boot/$ARCH-FOMOSv2CL-boot/rootf.cpuio.gz
}

main