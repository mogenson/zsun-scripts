#!/bin/sh

if [[ ! $(grep '/dev/sda1 /mnt' /proc/mounts | wc -c) -ge 14 ]]
then
    echo "sd card already unmounted"
    exit 0
fi

echo "unmount sd card"
umount /mnt &&

sleep 3

echo "detach sd card"
echo 1 > /sys/class/gpio/gpio21/value
