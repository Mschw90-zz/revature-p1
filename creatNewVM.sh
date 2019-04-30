#!/bin/bash

vmName=$1
groupName=$2
imgName=$3
diskName=$4

az vm create \
    --resource-group $groupName \
    --name $vmName \
    --image $imgName \
    --admin-username mschw90 \
    --generate-ssh-keys \
    --attach-data-disks $diskName