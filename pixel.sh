#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf vendor/advan/X1
rm -rf .repo/local_manifests
rm -rf .repo/local_manifests/remove_dolby.xml

git clone https://github.com/DooPrjkt/local_manifest.git -b px .repo/local_manifests
repo init --no-repo-verify --git-lfs -u https://github.com/Kitauji-High-School/pixelos_manifest.git -b sixteen-qpr2 -g default,-mips,-darwin,-notdefault
/opt/crave/resync.sh || repo sync

git clone --depth=1 https://github.com/DooPrjkt/android_device_advan_X1.git -b pixel device/advan/X1
git clone --depth=1 https://github.com/DooPrjkt/android_vendor_advan_X1.git -b pixel vendor/advan/X1
git clone --depth=1 https://github.com/G100-X1/android_device_advan_X1-kernel.git -b lineage-23.1 device/advan/X1-kernel

git clone https://github.com/G100-X1/device_mediatek_sepolicy_vndr.git -b lineage-23.1 device/mediatek/sepolicy_vndr
git clone https://github.com/G100-X1/hardware_mediatek.git -b lineage-23.1 hardware/mediatek
git clone https://github.com/G100-X1/android_vendor_mediatek_ims.git -b lineage-23.1 vendor/mediatek/ims
git clone https://github.com/G100-X1/android_vendor_sony_dolby.git -b sixteen-redesign vendor/sony/dolby
git clone https://github.com/putraaxzy/packages_apps_GameBar packages/apps/GameBar

export BUILD_USERNAME=miku
export BUILD_HOSTNAME=crave

source build/envsetup.sh
breakfast X1 user
m pixelos
