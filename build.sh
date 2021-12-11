#!/bin/bash
echo This script will build qt for the hyx300 and hyc50 platforms 
echo Note 1 - This script requires the cross compiler/toolchain to be installed under /opt/fslc-framebuffer
echo Note 2 - DO NOT SET ENVIROMENT with source, qt config must be run in normal enviroment
-p $”Press any key to continue\n”

echo Cleaning repo
git clean -xdf

../qt5/configure \
--opensource -confirm-license \
-device imx6 \
-release \
-force-pkg-config \
-v \
-prefix /usr/local/qt5 \
-extprefix ./buildOut/extprefix \
-hostprefix ./buildOut/hostprefix \
-device-option CROSS_COMPILE=/opt/fslc-framebuffer/2.4.1/sysroots/x86_64-fslcsdk-linux/usr/bin/arm-fslc-linux-gnueabi/arm-fslc-linux-gnueabi- \
-sysroot /opt/fslc-framebuffer/2.4.1/sysroots/armv7at2hf-neon-fslc-linux-gnueabi \
-skip qtwebengine \
-skip qtgamepad \
-skip qtlocation \
-skip qtwayland \
-nomake examples \
-nomake tests \
-no-pch \
-no-openssl \

(
source /opt/fslc-framebuffer/2.4.1/environment-setup-armv7at2hf-neon-fslc-linux-gnueabi 
make
make install
)

