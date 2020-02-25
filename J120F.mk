#
# Copyright (C) 2017-2018 The LineageOS Project
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

LOCAL_PATH := device/samsung/J120F

DEVICE_PACKAGE_OVERLAYS += device/samsung/J120F/overlay

TARGET_BOOTANIMATION_HALF_RES := true

TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

ifneq ($(TARGET_PREBUILT_KERNEL),)
$(TARGET_OUT)INTERMEDIATES)/KERNEL_OBJ/usr:
    mkdir -p $@
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/fstab.universal3475=:root/fstab.universal3475= \
    $(LOCAL_PATH)/ramdisk/init.baseband.rc=.rc:root/init.baseband.rc \
    $(LOCAL_PATH)/ramdisk/init.rilchip.rc:root/init.rilchip.rc \
    $(LOCAL_PATH)/ramdisk/init.rilcommon.rc:root/init.rilcommon.rc \
    $(LOCAL_PATH)/ramdisk/init.universal3475.rc:root/init.universal3475.rc \
    $(LOCAL_PATH)/ramdisk/init.universal3475.usb.rc=.rc:root/init.universal3475.usb.rc \
    $(LOCAL_PATH)/ramdisk/init.usb.rc=.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/ramdisk/init.wifi.rc:root/init.wifi.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.universal3475.rc:ueventd.universal3475.rc

# Packages
# Audio.
PRODUCT_PACKAGES += \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.primary.default \
    audio.primary.universal3475 \
    audio.tms.default \
    audio.usb.default \
    auduo_policy.default \
    bluetooth.default \
    gps.default \
    gralloc.default

# Camera
PRODUCT_PACKAGES += \
    Gallery2

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    libnetcmdiface \
    Stk \
    static_busybox \
    make_ext4fs \
    setup_fs

# telephony. Просто оставляем.# Other
PRODUCT_PACKAGES += \
    CMSettingsProvider \
    libkeyutils \
    libexifa \
    libjpega \
    ebtables \
    brctl \
    strongswan \
    KeyUtils \
    e2fsprog

# Wifi
PRODUCT_PACKAGES += \
    wpa_supplicant \
    dhcpcd.conf \
    p2p_supplicant_marlin_inc.conf \
    libnetcmdiface \
    keystore.default \
    local_time.default.so \
    power.default \
    vibrator.default

# Properties
# Default properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1 \
    audio_hal.force_voice_config=wide

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196609 \
    debug.hwc.force_gpu=1

# Hwui
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=24 \
    ro.hwui.layer_cache_size=16 \
    ro.hwui.path_cache_size=4 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.shape_cache_size=1 \
    ro.hwui.gradient_cache_size=0.5 \
    ro.hwui.drop_shadow_cache_size=2 \
    ro.hwui.r_buffer_cache_size=2 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=512 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=3
PRODUCT_LOCALES := en_US ru_RU

$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm4343/device-bcm.mk)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/allshare_library.xml:system/etc/permissions/allshare_library.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.live_wallpaper.xml:system/etc/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/android.software.webview.xml:system/etc/android.software.webview.xml \
    frameworks/native/data/etc/com.android.location.provider.xml:system/etc/com.android.location.provider.xml \
    frameworks/native/data/etc/com.android.media.remotedisplay.xml:system/etc/com.android.media.remotedisplay.xml \
    frameworks/native/data/etc/com.android.mediadrm.signer.xml:system/etc/com.android.mediadrm.signer.xml \
    frameworks/native/data/etc/com.broadcom.bt.xml:system/etc/com.broadcom.bt.xml \
    frameworks/native/data/etc/com.google.android.maps.xml:system/etc/com.google.android.maps.xml \
    frameworks/native/data/etc/com.google.android.media.effects.xml:system/etc/com.google.android.media.effects.xml \
    frameworks/native/data/etc/com.google.widevine.software.drm.xml:system/etc/com.google.widevine.software.drm.xml \
    frameworks/native/data/etc/com.samsung.android.feature.sdl.xml:system/etc/com.samsung.android.feature.sdl.xml \
    frameworks/native/data/etc/com.samsung.bbc.xml:system/etc/com.samsung.bbc.xml \
    frameworks/native/data/etc/com.samsung.device.xml:system/etc/com.samsung.device.xml \
    frameworks/native/data/etc/com.sec.android.app.minimode.xml:system/etc/com.sec.android.app.minimode.xml \
    frameworks/native/data/etc/com.sec.feature.call_vt_support.xml:system/etc/com.sec.feature.call_vt_support.xml \
    frameworks/native/data/etc/com.sec.feature.minimode.xml:system/etc/com.sec.feature.minimode.xml \
    frameworks/native/data/etc/com.sec.feature.motionrecognition_service.xml:system/etc/com.sec.feature.motionrecognition_service.xml \
    frameworks/native/data/etc/com.sec.smartcard.auth.xml:system/etc/com.sec.smartcard.auth.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/handheld_core_hardware.xml \
    frameworks/native/data/etc/imsmanager_library.xml:system/etc/imsmanager_library.xml \
    frameworks/native/data/etc/msgwrapper_library.xml:system/etc/msgwrapper_library.xml \
    frameworks/native/data/etc/org.simalliance.openmobileapi.xml:system/etc/org.simalliance.openmobileapi.xml \
    frameworks/native/data/etc/platform.xml:system/etc/platform.xml \
    frameworks/native/data/etc/rcsopenapi_library.xml:system/etc/rcsopenapi_library.xml \
    frameworks/native/data/etc/sagearpolicymanager.xml:system/etc/sagearpolicymanager.xml \
    frameworks/native/data/etc/saiv.xml:system/etc/saiv.xml \
    frameworks/native/data/etc/scamera_sdk_util.xml:system/etc/scamera_sdk_util.xml \
    frameworks/native/data/etc/seccamera.xml:system/etc/seccamera.xml \
    frameworks/native/data/etc/sec_edm.xml:system/etc/sec_edm.xml \
    frameworks/native/data/etc/sec_feature.xml:system/etc/sec_feature.xml \
    frameworks/native/data/etc/sec_hardware_library.xml:system/etc/sec_hardware_library.xml \
    frameworks/native/data/etc/secimaging.xml:system/etc/secimaging.xml \
    frameworks/native/data/etc/sec_mdm.xml:system/etc/sec_mdm.xml \
    frameworks/native/data/etc/secmediarecorder.xml:system/etc/secmediarecorder.xml \
    frameworks/native/data/etc/sec_platform_library.xml:system/etc/sec_platform_library.xml \
    frameworks/native/data/etc/secvision.xml:system/etc/secvision.xml \
    frameworks/native/data/etc/secvisualeffect.xml:system/etc/secvisualeffect.xml \
    frameworks/native/data/etc/simageis.xml:system/etc/simageis.xml \
    frameworks/native/data/etc/slinkntsmanager.xml:system/etc/slinkntsmanager.xml \
    frameworks/native/data/etc/smartfaceservice.xml:system/etc/smartfaceservice.xml \
    frameworks/native/data/etc/smat_library.xml:system/etc/smat_library.xml \
    frameworks/native/data/etc/touchwiz.xml:system/etc/touchwiz.xml \
    frameworks/native/data/etc/vtmanager_library.xml:system/etc/vtmanager_library.xml \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_NAME := SM
PRODUCT_DEVICE := J120F
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SM-J120F

# Keys
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/sec_touchkey.kl:/system/usr/keylayout/sec_touchkey.kl \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:/system/usr/keylayout/gpio-keys.kl

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/J120F.mk \
    $(LOCAL_DIR)/Android.mk \
    $(LOCAL_DIR)/AndroidProducts.mk \
    $(LOCAL_DIR)/BoardConfig.mk \
    $(LOCAL_DIR)/cm.mk \
    $(LOCAL_DIR)/full_J120F.mk


$(call inherit-product-if-exists, vendor/samsung/vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, vendor/samsung/J120F/vendor.mk)
# ninja
USE_NINJA := true

-include $(LOCAL_PATH)/system.prop

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/J120F.mk \
    $(LOCAL_DIR)/Android.mk \
    $(LOCAL_DIR)/AndroidProducts.mk \
    $(LOCAL_DIR)/BoardConfig.mk \
    $(LOCAL_DIR)/cm.mk \
    $(LOCAL_DIR)/full_J120F.mk

PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/zImage:kernel
