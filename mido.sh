#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf device/xiaomi/mido
rm -rf kernel/xiaomi/mido
rm -rf vendor/xiaomi/mido
rm -rf packages/modules/Connectivity
rm -rf system/bpf
rm -rf kernel/configs
rm -rf hardware/qcom/wlan
rm -rf hardware/qcom-caf/wlan
rm -rf hardware/xiaomi
rm -rf .repo/local_manifests

repo init --no-repo-verify --git-lfs -u https://github.com/ProjectMatrixx/android -b 16.2 -g default,-mips,-darwin,-notdefault

git clone https://github.com/DooPrjkt/local_manifest.git -b matrixx-bka .repo/local_manifests
/opt/crave/resync.sh || repo sync --force-sync --no-clone-bundle --no-tags

export BUILD_USERNAME=mibombo
export BUILD_HOSTNAME=crave

. build/envsetup.sh
lunch matrixx_mido-bp4a-userdebug
make matrixx
