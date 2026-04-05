#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init --no-repo-verify --git-lfs -u https://github.com/ProjectMatrixx/android -b 16.2 -g default,-mips,-darwin,-notdefault
/opt/crave/resync.sh || repo sync

git clone --depth=1 https://github.com/DooPrjkt/device_xiaomi_mido.git -b matrixx-bka device/xiaomi/mido
git clone --depth=1 https://github.com/NRanjan-17/vendor_xiaomi_mido.git -b sixteen vendor/xiaomi/mido
git clone --depth=1 https://github.com/NRanjan-17/kernel_xiaomi_mido.git -b sixteen kernel/xiaomi/mido

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.1 hardware/xiaomi

export BUILD_USERNAME=miku
export BUILD_HOSTNAME=crave

. build/envsetup.sh
lunch matrixx_mido-bp4a-userdebug
make matrixx
