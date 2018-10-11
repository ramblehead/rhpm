#!/bin/sh
# See http://askubuntu.com/questions/19954/how-to-set-the-monitor-to-its-native-resolution-which-is-not-listed-in-the-resol
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode Virtual1 1920x1080_60.00

xrandr --newmode "3840x2160_60.00"  712.75  3840 4160 4576 5312  2160 2163 2168 2237 -hsync +vsync
xrandr --addmode Virtual1 3840x2160_60.00

#xrandr --output Virtual1 --primary --mode 1920x1080_60.00
