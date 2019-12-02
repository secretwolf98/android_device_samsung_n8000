#
# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/samsung/midas

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
ARCH_ARM_HAVE_NEON := true

# Binder
TARGET_USES_64_BIT_BINDER := true

# Filesystem
BOARD_NAND_PAGE_SIZE := 4096
BOARD_NAND_SPARE_SIZE := 128
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1444888576
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12620578816
BOARD_FLASH_BLOCK_SIZE := 2048
TARGET_USERIMAGES_USE_EXT4 := true

# we don't have a vendor partition, include everything in the system.img
BOARD_USES_VENDORIMAGE := false
TARGET_COPY_OUT_VENDOR := system


# mkbootimg config
SUPPORTED_BOARDS := n8000
BOARD_CUSTOM_MKBOOTIMG = $(HOST_OUT_EXECUTABLES)/mkfitimage$(HOST_EXECUTABLE_SUFFIX)
BOARD_MKBOOTIMG_ARGS = $(foreach dtb,$(strip $(SUPPORTED_BOARDS)),--dtb $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/arch/arm/boot/dts/exynos4412-$(dtb).dtb)

# kernel config (see kernel.mk fiel for more info)
TARGET_KERNEL_SOURCE := kernel/samsung/n8000
TARGET_KERNEL_CONFIG := n8000_defconfig

BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_CMDLINE := console=ttySAC2,115200 androidboot.hardware=n8000 androidboot.selinux=permissive printk.devkmsg=on
BOARD_KERNEL_PAGESIZE := 2048
# BOARD_KERNEL_IMAGE_NAME := zImage
# NEED_KERNEL_MODULE_ROOT := true

# Mesa
BOARD_GPU_DRIVERS := exynos lima swrast
TARGET_SCREEN_DENSITY := 160

# generic wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211

# Platform
TARGET_BOARD_PLATFORM := exynos4
TARGET_SOC := exynos4412
TARGET_BOOTLOADER_BOARD_NAME := n8000
TARGET_NO_BOOTLOADER := true

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.n8000
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
ifeq ($(WITH_TWRP),true)
include $(LOCAL_PATH)/twrp.mk
endif

# Treble
# BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
PRODUCT_FULL_TREBLE_OVERRIDE := true
# FIXME: mesa/gbm-gralloc (which are SP-HALs) depend on libexpat (which is non-SP only)
#BOARD_VNDK_RUNTIME_DISABLE := true
BOARD_VNDK_VERSION := current
