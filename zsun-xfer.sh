#!/bin/bash

echo "mounting sd card"
if ! ssh root@zsun.local 'sh /root/sd-mount.sh'
then
    echo "couldn't mount sd card"
    exit 1
fi

for file in "$@"
do
    echo "transfering $file"
    if ! scp "$file" root@zsun.local:/mnt
    then
        echo "couldn't transfer $file"
        exit 1
    fi
done

echo "unmounting sd card"
if ! ssh root@zsun.local 'sh /root/sd-unmount.sh'
then
    echo "couldn't unmount sd card"
    exit 1
fi

echo "done"
