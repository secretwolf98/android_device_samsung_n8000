# Release name
PRODUCT_RELEASE_NAME := n8000

# Inherit device configuration
$(call inherit-product, device/samsung/n8000/n8000.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := n8000
PRODUCT_NAME := lineage_n8000
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-N8000
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=p4noterfxx \
	TARGET_DEVICE=p4noterf \
	BUILD_FINGERPRINT="LineageOS/Samsung/${PRODUCT_MODEL}/${PRODUCT_DEVICE}/${PLATFORM_VERSION}/${BUILD_ID}/${VERSON_INCREMENTAL}/userdebug/release-keys" \
	PRIVATE_BUILD_DESC="n8000-userdebug 7.1.2 NJH47F d6e8cf613f test-keys"
