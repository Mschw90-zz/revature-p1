

snapShot()
{
    diskName=$1
    groupName=$2
    vmName=$3
    snapName=$4

    az vm disk detach \
        -n $diskName \
        -g $groupName \
        --vm-name $vmName

    az snapshot create \
        -n $snapName \
        -g $groupName \
        --size-gb 10 \
        --source $diskName
    
    az vm disk attach \
        -g $groupName \
        --vm-name vmName \
        --name $diskName


    mount /dev/sdc /media/disk/
    chown -R mschw90:mschw90 /media/disk
    chmod -R 766 /media/disk
}

image()
{
    groupName=$1
    vmName=$2
    imgName=$3

    az vm deallocate \
    --resource-group $groupName \
    --name $vmName

    # // then you will generalize the vm
    az vm generalize \
    --resource-group $groupName \
    --name $vmName

    # // create the image of the vm
    az image create \
        --resource-group myResourceGroup \
        --name $imgName \
        --source $vmName
}


command=$1
$command $2 $3 $4 $5