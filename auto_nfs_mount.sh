#!/bin/bash

SERVER=$1

MOUNT_POINTS=$(sed -e '/^.*#/d' -e '/^.*:/!d' -e 's/\t/ /g' /etc/fstab | tr -s " " | cut -f2 -d" "|grep $SERVER)

ping -c 1 "${SERVER}" &>/dev/null

if [ $? -ne 0 ]; then
    # The server could not be reached, unmount the shares
    for umntpnt in ${MOUNT_POINTS}; do
        umount -l -f $umntpnt &>/dev/null
    done
else
    # The server is up, make sure the shares are mounted
    for mntpnt in ${MOUNT_POINTS}; do
        mountpoint -q $mntpnt || mount $mntpnt
    done
fi
