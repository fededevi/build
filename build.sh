#!/bin/bash

../qt5/configure \
--opensource -confirm-license \
-device imx6 \
-prefix /usr/local/qt5 \
-extprefix ./buildOut/extprefix \
-hostprefix ./buildOut/hostprefix/ \
-device-option CROSS_COMPILE=/opt/fslc-framebuffer/2.4.1/sysroots/x86_64-fslcsdk-linux/usr/bin/arm-fslc-linux-gnueabi/arm-fslc-linux-gnueabi- \
-sysroot /opt/fslc-framebuffer/2.4.1/sysroots/armv7at2hf-neon-fslc-linux-gnueabi \
-release \
-make libs \
-nomake examples -no-icu -nomake tests  -no-feature-openssl  -skip qtwebengine \
-no-pch -no-xcb -make libs -release -opengl es2 -egl -eglfs -v \
-skip serialport \

