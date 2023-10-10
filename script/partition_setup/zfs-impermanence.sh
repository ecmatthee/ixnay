#!/usr/bin/env bash

# TODO Logging

main() {
    shell_settings
    declare_globals
    partition
    boot_setup
    # zfs_setup
}

shell_settings() {
    set -euo pipefail
    trap finish EXIT
    IFS=$'\n\t'
}

declare_globals() {
    DISK="/dev/disk/by-id/nvme-CT1000P1SSD8_1925E20D2963_1"

    BOOT_PARTITION="${DISK}-part1"
    SWAP_PARTITION="${DISK}-part2"
    ROOT_PARTITION="${DISK}-part3"

    ZPOOL="rpool"

    ZFS_ENCRYPTED="${ZPOOL}/enc"

    ZFS_NIX="${ZFS_ENCRYPTED}/nix"
    ZFS_IMPERMANENCE="${ZFS_ENCRYPTED}/impermanence"
    ZFS_PERSIST="${ZFS_ENCRYPTED}/persist"

    ZFS_ROOT="${ZFS_IMPERMANENCE}/root"
    ZFS_HOME="${ZFS_IMPERMANENCE}/home"

    ZFS_PERSIST_SYSTEM="${ZFS_PERSIST}/system"
    # ZFS_P_HOME="${ZFS_PERSIST}/home"

    ZFS_BLANK_SNAPSHOT_ROOT="${ZFS_ROOT}@blank"
    ZFS_BLANK_SNAPSHOT_HOME="${ZFS_HOME}@blank"
    ZFS_ASHIFT=12
}

partition() {
    parted $DISK -- mklabel gpt
    parted $DISK -- mkpart ESP fat32 0% 512MiB
    parted $DISK -- set 1 boot on
    parted $DISK -- mkpart zramwbd 512MiB 8GiB
    parted $DISK -- mkpart primary ext4 8GiB 100%
}

boot_setup() {
    mkfs.fat -F32 -n NIXBOOT "${BOOT_PARTITION}"
    mkfs.ext4 -L "nix" "${ROOT_PARTITION}"
}

zfs_setup() {
    zpool_creation
    zpool_settings
    zfs_dataset_creation
}

zpool_creation() {
    zpool create -f -o ashift="${ZFS_ASHIFT}" "${ZPOOL}" "${ROOT_PARTITION}"
}

zpool_settings() {
    zfs set compression=zstd "${ZPOOL}"
    zfs set xattr=sa "${ZPOOL}"
    zfs set atime=on "${ZPOOL}"
    zfs set relatime=on "${ZPOOL}"
}

zfs_dataset_creation() {
    zfs create -o mountpoint=none -o encryption=on -o keyformat=passphrase -o keylocation=prompt "${ZFS_ENCRYPTED}"

    zfs create -o mountpoint=legacy "${ZFS_NIX}"
    zfs set atime=off "${ZFS_NIX}"
    zfs set relatime=off "${ZFS_NIX}"
    zfs set com.sun:auto-snapshot=off "${ZFS_NIX}"

    zfs create -o mountpoint=legacy "${ZFS_PERSIST}"
    zfs set com.sun:auto-snapshot=true "${ZFS_PERSIST}"

    zfs create -o mountpoint=legacy "${ZFS_PERSIST_SYSTEM}"

    zfs create -o mountpoint=none "${ZFS_IMPERMANENCE}"
    zfs set atime=off "${ZFS_IMPERMANENCE}"
    zfs set relatime=off "${ZFS_IMPERMANENCE}"
    zfs set com.sun:auto-snapshot=off "${ZFS_IMPERMANENCE}"

    zfs create -o mountpoint=legacy "${ZFS_ROOT}"
    zfs snapshot "${ZFS_BLANK_SNAPSHOT_ROOT}"

    zfs create -o mountpoint=legacy "${ZFS_HOME}"
    zfs snapshot "${ZFS_BLANK_SNAPSHOT_HOME}"
}

disk_mount() {
    mount -t zfs "${ZFS_ROOT}" /mnt

    mkdir -p /mnt/{boot,home,nix,persist}
    mount -t vfat "${BOOT_PARTITION}" /mnt/boot
    mount -t zfs "${ZFS_HOME}" /mnt/home
    mount -t zfs "${ZFS_NIX}" /mnt/nix
    persist_mount
}

persist_mount() {
    mount -t zfs "${ZFS_PERSIST}" /mnt/persist
    mkdir /mnt/persist/system
    mount -t zfs "${ZFS_PERSIST_SYSTEM}" /mnt/persist/system
}

finish() {
    echo "System setup complete."
}

main
