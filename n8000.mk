# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_n8000
PRODUCT_DEVICE := n8000
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-N8000
PRODUCT_MANUFACTURER := samsung