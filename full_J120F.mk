# Inherit device configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk) # при изучении всех *.mk файлов по пути build/target/product этот собирает самый полный циан.
$(call inherit-product, device/samsung/J120F/J120F.mk)
$(call inherit-product, device/samsung/J120F/vendor.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := full_J120F.name
PRODUCT_DEVICE := J120F
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-J120F
PRODUCT_MANUFACTURER := samsung
