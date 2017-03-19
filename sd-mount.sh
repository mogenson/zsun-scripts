#!/bin/sh

if [[ $(grep '/dev/sda1 /mnt' /proc/mounts | wc -c) -ge 14 ]]
then
    echo "sd card is already mounted"
    exit 0
fi

echo "attaching sd card"
echo 0 > /sys/class/gpio/gpio21/value

sleep 3

echo "mounting sd card"
mount /dev/sda1 /mnt
