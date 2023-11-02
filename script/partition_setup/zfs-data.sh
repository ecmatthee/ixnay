#!/usr/bin/env bash

main() {
    # TODO Logging
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
    echo "Starting"
}

zfs_setup() {
    # TODO Localise and pass pool_name
    pool_name="pi"

    create_zpool
    apply_zpool_settings
    create_root_datasets
}

create_zpool() {
    local ashift=12
    local disks=("ata-ST6000DM003-2CY186_WCT3584R" "ata-ST6000DM003-2CY186_WCT2F0EA")

    zpool create -f -o ashift="${ashift}" "${pool_name}" mirror "${disks[@]}"

    echo "Created Pool"
    # TODO Special VDEV
    # TODO Move normalization to pool creation
    normalization="formD"
}

apply_zpool_settings() {
    local pool_settings=(
        compression=zstd
        aclinherit=passthrough
        acltype=posixacl
        xattr=sa
        atime=on
        relatime=on
        com.sun:auto-snapshot=true
    )

    for setting in "${pool_settings[@]}"; do
        zfs set "${setting}" "${pool_name}"
    done
    echo "Pool settings set"
}

create_root_datasets() {
    local secret_folder="/nix/secret/zfs_key"
    local reserved_dataset="${pool_name}/reserved"
    local reserved_space="500G"

    # TODO
    media_dataset="${pool_name}/media"

    local -A datasets
    datasets["${pool_name}/data"]="file://${secret_folder}/data.key"
    datasets["${media_dataset}"]="file://${secret_folder}/media.key"
    datasets["${pool_name}/prj"]="file://${secret_folder}/prj.key"

    for dataset in "${!datasets[@]}"; do
        local encryption_key="${datasets[$dataset]}"
        zfs create -o encryption=on -o keyformat=hex -o keylocation="${encryption_key}" -o normalization="${normalization}" "${dataset}"
    done

    zfs create -o refreservation="${reserved_space}" -o mountpoint=none "${reserved_dataset}"

    echo "Base datasets created"
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
    echo "Sub datasets created"
}

main
