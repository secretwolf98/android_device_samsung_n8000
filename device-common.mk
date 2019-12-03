$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline.mk)

LOCAL_PATH := device/samsung/n8000

PRODUCT_PACKAGES += \
    Dialer \
    Launcher3QuickStep \
    WallpaperPicker \

PRODUCT_MANUFACTURER := samsung
PRODUCT_BRAND := android

# screen configuration
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 160dpi
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi

# kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := kernel/samsung/n80xx/zImage-dtb
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES +=   $(LOCAL_KERNEL):kernel

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
    android.hardware.graphics.mapper@2.0-impl \
	gralloc.gbm \
	hwcomposer.drm \
    libdrm.exynos \
	libGLES_mesa \
	libstdc++.vendor \

PRODUCT_PROPERTY_OVERRIDES += \
	debug.drm.mode.force=1280x800 \
    gralloc.drm.device=/dev/dri/renderD128 \
	ro.opengles.version=131072

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.n8000:root/fstab.n8000 \
    $(LOCAL_PATH)/rootdir/init.target.rc:root/init.target.rc

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