#
# Copyright (C) 2017 The LineageOS Project
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

LOCAL_PATH := device/samsung/n8000

# screen configuration
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 160dpi
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi

# display setting
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# graphics
PRODUCT_PACKAGES += \
	android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl
	gralloc.gbm \
	hwcomposer.drm \
	libGLES_mesa \
	libstdc++.vendor \

PRODUCT_PROPERTY_OVERRIDES += \
	debug.drm.mode.force=1280x800 \
    gralloc.drm.device=/dev/dri/renderD128 \
	ro.opengles.version=131072

# FIXME: remove this.
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/libexpat.so:vendor/lib/libexpat.so

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.n8000:root/fstab.n8000 \
    $(LOCAL_PATH)/rootdir/init.target.rc:root/init.target.rc \
	$(LOCAL_PATH)/recovery/init.recovery.midas.rc:root/init.recovery.midas.rc \

# Add wifi-related packages
PRODUCT_PACKAGES += libwpa_client wpa_supplicant hostapd wificond
PRODUCT_PROPERTY_OVERRIDES += wifi.interface=wlan0 \
                              wifi.supplicant_scan_interval=15

# Build and run only ART
PRODUCT_RUNTIMES := runtime_libart_default

# testing this
PRODUCT_SHIPPING_API_LEVEL := 25

# for testing
PRODUCT_PACKAGES += ssh sftp scp sshd ssh-keygen sshd_config start-ssh

# Treble
PRODUCT_PACKAGES += \
	vndk_package \

DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/manifest.xml
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true