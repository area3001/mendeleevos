## About
This is a Buildroot external tree for the OS of the master node (Raspberry Pi 3) of the Mendeleev project.

The image includes a [Mosquitto broker](https://mosquitto.org/
) and the [mqtt2mendeleev](https://github.com/area3001/mqtt2mendeleev) bridge software.

## Prerequisites
Prerequisites for buildroot [https://buildroot.org/downloads/manual/manual.html#requirement-mandatory]()

## Getting started
Clone the repository
```
git clone git@github.com:area3001/mendeleevos.git
cd mendeleevos
git submodule update --init
cd buildroot
```
To build:
```
make BR2_EXTERNAL=../ mendeleev_rpi3_defconfig
make BR2_EXTERNAL=../
```
Use the option ```BR2_JLEVEL=<number>``` to set the ```J=<number>``` for make. Then wait...

The generated image will be in ```output/images/sdcard.img```. To write the image to the SD card, use:
```
sudo dd if=output/image/sdcard.img of=/dev/mmcblk0
```
