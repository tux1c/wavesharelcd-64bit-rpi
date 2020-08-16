#!/bin/bash

# prepare X11
rm -rf /etc/X11/xorg.conf.d/40-libinput.conf
mkdir -p /etc/X11/xorg.conf.d
cp -rf ./99-calibration.conf  /etc/X11/xorg.conf.d/99-calibration.conf
cp -rf ./99-fbturbo.conf  /etc/X11/xorg.conf.d/99-fbturbo.conf

# load module on boot
cp ./waveshare35a.dtbo /boot/overlays/
echo "hdmi_force_hotplug=1" >> /boot/config.txt
echo "dtparam=i2c_arm=on" >> /boot/config.txt
echo "dtparam=spi=on" >> /boot/config.txt
echo "enable_uart=1" >> /boot/config.txt
echo "dtoverlay=waveshare35a:rotate=90" >> /boot/config.txt
cp ./cmdline.txt /boot/

# touch screen calibration
apt-get install xserver-xorg-input-evdev
cp -rf /usr/share/X11/xorg.conf.d/10-evdev.conf /usr/share/X11/xorg.conf.d/45-evdev.conf

# done :)
echo "reboot now"
reboot
