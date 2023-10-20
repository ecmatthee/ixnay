#!/usr/bin/env bash

main() {
    shell_settings
    declare_globals
    zfs_setup
}

shell_settings() {
    set -euo pipefail
    trap finish EXIT
    IFS=$'\n\t'
}

finish() {
    echo "Script exited or terminated!"
}

declare_globals() {
    echo "message"
}

zfs_setup() {
    pool_name="pi"
    data_dataset="${pool_name}/data"
    media_dataset="${pool_name}/media"
    project_dataset="${pool_name}/prj"

    create_zpool
    apply_zpool_settings
    create_zfs_datasets
}

create_zpool() {
    local ashift=12
    local disks=("ata-ST6000DM003-2CY186_WCT3584R" "ata-ST6000DM003-2CY186_WCT2F0EA")

    zpool create -f -o ashift="${ashift}" "${pool_name}" mirror "${disks[@]}"
}

apply_zpool_settings() {
    local pool_settings=(
        compression=zstd
        aclinherit=passthrough
        acltype=posixacl
        xattr=sa
        atime=on
        relatime=on
        normalization=formD
        com.sun:auto-snapshot=on
    )

    for setting in "${pool_settings[@]}"; do
        zfs set "${setting}" "${pool_name}"
    done
}

create_zfs_datasets() {
    local secret_folder="/nix/secret/zfs_key"

    local -A datasets
    datasets["${data_dataset}"]="file://${secret_folder}/data.key"
    datasets["${media_dataset}"]="file://${secret_folder}/media.key"
    datasets["${project_dataset}"]="file://${secret_folder}/prj.key"

    for dataset in "${!datasets[@]}"; do
        local key="${datasets[$dataset]}"
        zfs create -o encryption=on -o keyformat=hex -o keylocation="${key}" "${dataset}"
    done

    zfs create -o refreservation=10G -o mountpoint=none "${pool_name}"/reserved

    expand_media
}

expand_media() {
    local -A datasets
    datasets["${media_dataset}/video"]="1M"
    datasets["${media_dataset}/sound"]="1M"
    datasets["${media_dataset}/library"]="128K"
    datasets["${media_dataset}/game"]="128K"
    datasets["${media_dataset}/image"]="128K"

    for dataset in "${!datasets[@]}"; do
        local recordsize="${datasets[$dataset]}"
        zfs create -o recordsize="${recordsize}"  "${dataset}"
    done
}

main
