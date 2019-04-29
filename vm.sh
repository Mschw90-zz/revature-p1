#!/bin/bash

if [ -z "$(which az)" ]; then
    echo "azure-cli is not installed"
fi


groupName=$1
location=$2
VMname=$3
typeOfImage=$4
size=$5
diskName=$6

az group create \
    -n $groupName \
    -l $location



VMcheck=$(az vm list --query [].name | grep -E $VMname)

if [ -n "$VMcheck" ]; then 
    echo "this vm name already exist please choose another"
    exit 1
fi

az vm create 
    -n $VMname \
    -g $groupName \
    --image $typeOfImage \
    --size $size \
    --generate-ssh-keys \
    --admin-username mschw90
    --custom-data ./init-vm.txt
    --attach-data-disks $diskName

az vm open-port \
    -g $groupName \
    -n $VMname \
    --port 8080 \
    --priority 800

