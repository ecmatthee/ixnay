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
        xattr=sa
        atime=on
        relatime=on
        com.sun:auto-snapshot=on
    )

    for setting in "${pool_settings[@]}"; do
        zfs set "${setting}" "${pool_name}"
    done
}

create_zfs_datasets() {
    secret_folder="/nix/secret"

    local -A datasets
    datasets["${pool_name}/data"]="file://${secret_folder}/data.key"
    datasets["${pool_name}/media"]="file://${secret_folder}/media.key"
    datasets["${pool_name}/prj"]="file://${secret_folder}/prj.key"

    for dataset in "${!datasets[@]}"; do
        local key="${datasets[$dataset]}"
        zfs create -o encryption=on -o keyformat=hex -o keylocation="${key}" "${dataset}"
    done
}

main
