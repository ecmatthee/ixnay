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

declare_globals() {
    # DISK="/dev/disk/by-id/nvme-CT1000P1SSD8_1925E20D2963_1"
    # TODO DISK Array

    ZFS_POOL="pi"
    ZFS_DS_ENCRYPTED="${ZFS_POOL}/enc"
    ZFS_ASHIFT=12
}

zfs_setup() {
    zpool_creation
    zpool_settings
    zfs_dataset_creation
}

zpool_creation() {
    zpool create -f -o ashift="${ZFS_ASHIFT}" "${ZFS_POOL}" \
        mirror \
            ata-ST6000DM003-2CY186_WCT3584R \
            ata-ST6000DM003-2CY186_WCT2F0EA
}

zpool_settings() {
    zfs set compression=zstd "${ZFS_POOL}"
    zfs set xattr=sa "${ZFS_POOL}"
    zfs set atime=on "${ZFS_POOL}"
    zfs set relatime=on "${ZFS_POOL}"
    zfs set com.sun:auto-snapshot=on "${ZFS_POOL}"
}

zfs_dataset_creation() {
    zfs create -o encryption=on -o keyformat=hex -o keylocation=file:///key "${ZFS_DS_ENCRYPTED}"
    zfs create "${ZFS_DS_ENCRYPTED}"/prj
    zfs create "${ZFS_DS_ENCRYPTED}"/prj/dev
    zfs create "${ZFS_DS_ENCRYPTED}"/prj/dev/ixnay
    zfs create "${ZFS_DS_ENCRYPTED}"/prj/vid
    zfs create "${ZFS_DS_ENCRYPTED}"/prj/img
    zfs create "${ZFS_DS_ENCRYPTED}"/prj/wrt
    zfs create "${ZFS_DS_ENCRYPTED}"/vid
    zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/vid/tv
    zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/vid/mv
    zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/vid/vd
    zfs create "${ZFS_DS_ENCRYPTED}"/snd
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/snd/music
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/snd/pcast
    zfs create "${ZFS_DS_ENCRYPTED}"/img
    zfs create "${ZFS_DS_ENCRYPTED}"/lib
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/lib/abook
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/lib/ebook
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/lib/comic
    zfs create "${ZFS_DS_ENCRYPTED}"/web
    #zfs create "${ZFS_DS_ENCRYPTED}"/web/wget
    zfs create "${ZFS_DS_ENCRYPTED}"/gms
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/pc
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/nes
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/snes
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/gb
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/gbc
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/gba
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/n64
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/gc
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/nds
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/wii
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/wiiu
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/switch
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/psx
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/ps2
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/ps3
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/psp
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/sg1000
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/sms
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/mdr
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/mcd
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/saturn
    #zfs create -o recordsize=1M "${ZFS_DS_ENCRYPTED}"/gms/dc
    #zfs create -o recordsize=64K "${ZFS_DS_ENCRYPTED}"/gms/gg
}

main
