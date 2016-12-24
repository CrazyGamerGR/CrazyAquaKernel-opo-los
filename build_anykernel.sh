#!/bin/bash
#
# Copyright - CrazyGamerGR
#     		 ________     __   ___
#    		/ ______|    |  | /  |
#    		|  |         |  |/  /
#   		|  |_____    |      \              
#   		\_______|    |__|\___|
##########################################
export ARCH=arm
export CROSS_COMPILE=/home/francesco/arm-eabi-4.9-linaro/bin/arm-eabi-
##########################################
mkdir output
##########################################
make -C $(pwd) O=output cyanogenmod_bacon_defconfig 
make -C $(pwd) O=output
##########################################
cp output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage
##########################################
chmod 777 tools_crazy/dtbToolCM
##########################################
tools_crazy/dtbToolCM -2 -o output/arch/arm/boot/dt.img -s 2048 -p output/scripts/dtc/ output/arch/arm/boot/
