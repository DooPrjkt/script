#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf device/xiaomi/mido
rm -rf kernel/xiaomi/mido
rm -rf vendor/xiaomi/mido

repo init --no-repo-verify --git-lfs -u https://github.com/ProjectMatrixx/android -b 16.2 -g default,-mips,-darwin,-notdefault

git clone https://github.com/DooPrjkt/local_manifest/blob/matrixx-bka/local_manifest.xml -b matrixx-bka .repo/local_manifests
/opt/crave/resync.sh || repo sync

export BUILD_USERNAME=mibombo
export BUILD_HOSTNAME=crave

. build/envsetup.sh
lunch matrixx_mido-bp4a-userdebug
make matrixx
