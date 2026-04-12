#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf frameworks/base
rm -rf packages/apps/Settings
rm -rf build/soong
rm -rf vendor/custom
rm -rf .repo/local_manifests

repo init --no-repo-verify --git-lfs -u https://github.com/PixelOS-AOSP/android_manifest.git -b sixteen-qpr2 --g default,-mips,-darwin,-notdefault

git clone https://github.com/mibomboq/local_manifest.git -b main .repo/local_manifests
/opt/crave/resync.sh || repo sync --force-sync --no-clone-bundle --no-tags

export BUILD_USERNAME=mibombo
export BUILD_HOSTNAME=crave

source build/envsetup.sh
breakfast X1 user
m pixelos
