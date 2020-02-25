# Release name
CM_DEVICE := J120F
PRODUCT_RELEASE_NAME := J120F
TARGET_OTA_ASSERT_DEVICE := J120F

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/cm/config/themes_common.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/J120F/full_J120F.mk)

# Inherit from oneplus2 device
$(call inherit-product, device/samsung/J120F/J120F.mk)

## Device identifier. This must come after all inclusions
PRODUCT_MODEL := SM-J120F
PRODUCT_BRAND := samsung
PRODUCT_NAME := cm_J120F
PRODUCT_DEVICE := J120F
PRODUCT_MANUFACTURER := samsung
