#!/bin/bash

groupName=$1
vmName=$2
url=$3

az vm extension set \
    -g $groupName \
    --vm-name $vmName \
    --publisher Microsoft.Azure.extensions \
    --settings "{\"fileUris\":[\"$url\"]}" 