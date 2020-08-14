A quick guide on how to install a (3.5) waveshare(/clone) LCD on a Raspberry Pi running 64bit OS (namely Raspbian).
Guide is written for 3.5 inch screen but could be adapted for any screen.

# Installation
`git clone https://github.com/tux1c/wavesharelcd-64bit-rpi.git`

`cd wavesharelcd-64bit-rpi`

`chmod +x install.sh`

`sudo bash install.sh`

# Troubleshooting
## White screen on boot (raspberry pi boots)
make sure `dtoverlay=vc4-fkms-v3d` is **NOT** present / commented out in `/boot/config.txt`

# Adapting for other LCDs
1. clone https://github.com/swkim01/waveshare-dtoverlays
2. compile on the raspberry pi running 64bit OS the desired overlay:
`dtc -I dts -O dtb -f waveshareXYZ.dts -o waveshareXYZ.dtbo`
3. copy the output file to `/boot/overlays`
4. grab calibration file (`99-calibration...`) from https://github.com/goodtft/LCD-show and place in `/etc/X11/xorg.conf.d/99-calibration.conf`
