#!/bin/bash

unmount()
{
    umount /media/disk
    waagent -deprovision+user -force

    exit
}

mount()
{
    mount /dev/sdc /media/disk/
    chown -R mschw90:mschw90 /media/disk
    chmod -R 766 /media/disk
}

command=$1
$command